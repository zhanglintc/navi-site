<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- 可能是适配移动端用的 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <script type="text/javascript" src="./static/js/jquery1.8.3.min.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./static/js/jquery1.4.1.cookie.min.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./static/js/index.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./static/layer/layer.js?{{static_file_version}}"></script>

    <link rel="stylesheet" type="text/css" href="./static/css/common.css?{{static_file_version}}">

    <link rel="shortcut icon" href="./static/img/compass_128.ico"/>
    <link rel="bookmark" href="./static/img/compass_128.ico"/>

    <title>Navigator</title>
  </head>

  <body>
    <div id="main">
      <div id="header"></div>

      <div id="center">
        <h1 id="title">
          <span onclick="toggle_editable()" style="cursor: pointer;">Navigator</span>
        </h1>
        <div id="search_area">
          <input type="text" id="search_bar" name="search" onfocus="this.select()" onmouseup="preventDefault(event)" onkeypress='if(event.keyCode==13){window.open("https://www.google.com/search?q=" + $("#search_bar").val())}'>
        </div>
        <div id="table_wrapper">
          <div id="mask"></div>
          <table id="navi_table" align="center">
            <?php
              $fr = fopen("sites.json", "r") or die("Unable to open file!");
              $content_json = fread($fr, filesize("sites.json"));
              fclose($fr);

              $sites = json_decode($content_json);

              $idx = 0;
              for ($row=0; $row<4; $row++) {
                echo "<tr>";
                for ($line=0; $line<5; $line++) {
                  echo "<td>";
                  $sn = "sn_$idx";
                  $item = $sites->{$sn};
                  $name = $item[0];
                  $site = $item[1];
                  echo "<span class='cells' id='$sn' url='$site' onclick=\"cell_click('$sn')\">$name</span>";
                  echo "</td>";
                  $idx++;
                }
                echo "</tr>";
              }
            ?>
          </table>
        </div>
        <div id="background_discreption"></div>
      </div>

      <div id="footer">
        <div id="copyright"></div>
      </div>
    </div>

    <script type="text/javascript">
      function set_description(daysAgo, description) {
        let desc = $(`#background_discreption`);
        desc.text(description);
      }

      window.editable = false;
      $("#search_bar").focus();
      Copyright();
    </script>

    <script defer src="https://bing.zhanglintc.co/description_with_callback?daysAgo=0&callback=set_description"></script>
  </body>
</html>


