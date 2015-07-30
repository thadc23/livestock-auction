<html>
    <head>
        <title><g:layoutTitle default="Auction" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'invoice.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript library="jquery" plugin="jquery"/>
        <r:layoutResources/>
        <g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        <div id="grailsLogo" class="logo"><img src="${resource(dir:'images',file:'logo.gif')}" border="0" /></div>
        <g:layoutBody />
    </body>
</html>