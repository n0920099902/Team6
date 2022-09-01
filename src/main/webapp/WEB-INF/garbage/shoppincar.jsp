<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery shopkart.js Shopping Cart Plugin Demo</title>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.0.0/flatly/bootstrap.min.css">
    <style>
    body { background-color: #fafafa; }
    .container { margin-top: 150px; }
</style>
</head>
<body>
<div id="jquery-script-menu">
<div class="jquery-script-center">
<ul>
<li><a href="https://www.jqueryscript.net/other/Shopping-Card-Plugin-jQuery-Shopkart.html">Download This Plugin</a></li>
<li><a href="https://www.jqueryscript.net/">Back To jQueryScript.Net</a></li>
</ul>
<div class="jquery-script-ads"><script type="text/javascript"><!--
google_ad_client = "ca-pub-2783044520727903";
/* jQuery_demo */
google_ad_slot = "2780937993";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
<div class="jquery-script-clear"></div>
</div>
</div>
    <div class="container">
        <h1>jQuery shopkart.js Shopping Cart Plugin Demo</h1>
        <div class="card text-white bg-info mb-3" style="width: 18rem;">
            <div class="card-header">Cart Info</div>
            <div class="card-body" data-kart="display">
                <div>Total item: <span data-kart-total-item="0">0</span></div>
                <div>Total Price: $<span data-kart-total-price="0">0.00</span></div>
            </div>
        </div>

        <table class="table table-striped table-bordered">
            <tr>
                <th class="text-center">Product</th>
                <th class="text-center">Description</th>
                <th class="text-center">Price $</th>
                <th class="text-center">Action</th>
            </tr>
            <tr>
                <td>Playstation 4 Pro 1TB</td>
                <td>PlayStation 4 Pro 1TB Limited Edition Console - God of War Bundle</td>
                <td>$449.98</td>
                <td class="text-center">
                    <button class="btn btn-primary btn-sm btn-block"
                        data-kart="item-button"
                        data-kart-item-status="add-item"
                        data-kart-item='{"id": 1, "price": 449.98}'>
                        Add to Cart
                    </button>
                </td>
            </tr>
            <tr>
                <td>Xobx ONE S 500GB</td>
                <td>Xbox One S 500GB Console - Minecraft Complete Adventure Bundle</td>
                <td>$270.00</td>
                <td class="text-center">
                    <button class="btn btn-primary btn-sm btn-block"
                        data-kart="item-button"
                        data-kart-item-status="add-item"
                        data-kart-item='{"id": 2, "price": 270.00}'>
                        Add to Cart
                    </button>
                </td>
            </tr>
            <tr>
                <td>Nintendo Switch</td>
                <td>Nintendo Switch - Neon Blue and Red Joy-Con</td>
                <td>$298.99</td>
                <td class="text-center">
                    <button class="btn btn-primary btn-sm btn-block"
                        data-kart="item-button"
                        data-kart-item-status="add-item"
                        data-kart-item='{"id": 3, "price": 298.99}'>
                        Add to Cart
                    </button>
                </td>
            </tr>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="shopkart.js"></script>
    <script>
    $(function () {
        $.shopkart();
    });
    </script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
