module Web.View.Pancakes.New where
import Web.View.Prelude

data NewView = NewView { pancake :: Pancake }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PancakesAction}>Pancakes</a></li>
                <li class="breadcrumb-item active">New Pancake</li>
            </ol>
        </nav>
        <h1>New Pancake</h1>
        {renderForm pancake}
    |]

renderForm :: Pancake -> Html
renderForm pancake = formFor pancake [hsx|

    {submitButton}
|]
