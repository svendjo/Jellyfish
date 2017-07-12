<#-- @ftlvariable name="" type="${package}.views.PersonView" -->
<html>
    <head>
      <link rel="stylesheet" href="/assets/pure-min.css">
    </head>
    <body>
        <!-- calls getPerson().getFullName() and sanitizes it -->
        <h1>Hello, ${r"${person.fullName?html}"}!</h1>
        You are an awesome ${r"${person.jobTitle?html}"}.
    </body>
</html>