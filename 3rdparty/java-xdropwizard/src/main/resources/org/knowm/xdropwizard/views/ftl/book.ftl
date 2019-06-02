<!DOCTYPE html>
<html lang="en">

<head>
  <title>Book</title>
  <!-- Bootstrap core CSS -->
  <link href="/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<h1>Sample Dynamic Freemarker Page</h1>
<p>This is a sample html page demonstrating Freemarker templates.</p>

<div>
  <div class="markdown">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <table class="table">
            <tr>
              <td>Book Title:</td>
              <td>${book.title}</td>
            </tr>
            <tr>
              <td>Book Author:</td>
              <td>${book.author}</td>
            </tr>
            <tr>
              <td>Book Price:</td>
              <td>${book.price}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

</body>

</html>
