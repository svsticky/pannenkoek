module Web.View.Pancakes.Index where
import Web.View.Prelude

data IndexView = IndexView { pancake :: Pancake, pancakes :: [Pancake] }

renderFileFields :: Pancake -> Html
renderFileFields pancake = [hsx|
    <input type="file" name="fileurls" class="form-control-file" multiple/>
|]

renderForm :: Pancake -> Html
renderForm pancake = formFor pancake [hsx|
    {(textField #recipient) { placeholder = "This is you" }}
    {(textField #iban) { placeholder = "IBAN" }}
    {(textField #email) { placeholder = "money@yourname.dev?" }}
    {(numberField #amount) }
    {(textField #description) { placeholder = "What u buy? a graafmachine?" }}
    {(textField #forwhat) { placeholder = "Committee/Person", fieldLabel = "What for" }}
    {renderFileFields pancake}
    {(textField #notes) { placeholder = "Pay me pancake!" }}
    {submitButton}
|]

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PancakesAction}>Pancakes</a></li>
            </ol>
        </nav>
        <h1>Pay Pancake!</h1>

        {renderForm pancake} 
        <table class="table">
        {forEach pancakes renderPancake}
        </table>
    |]


renderPancake :: Pancake -> Html
renderPancake pancake = [hsx|
    <tr>
        <td>{get #recipient pancake}</td>
        <td>{get #iban pancake}</td>
        <td>{get #amount pancake}</td>
    </tr>
|]
