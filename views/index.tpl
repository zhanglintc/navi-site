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

    <script type="text/javascript" src="./js/jquery1.8.3.min.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./js/jquery1.4.1.cookie.min.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./js/index.js?{{static_file_version}}"></script>
    <script type="text/javascript" src="./layer/layer.js?{{static_file_version}}"></script>

    <link rel="stylesheet" type="text/css" href="./css/common.css?{{static_file_version}}">

    <link rel="shortcut icon" href="./img/compass_128.ico"/>
    <link rel="bookmark" href="./img/compass_128.ico"/>

    <title>Navigator</title>
  </head>

  <body>
    <script type="text/javascript">
      window.editable = false;
    </script>

    <div id="main">
      <div id="mask"></div>

      <div id="header"></div>

      <div id="center_board">
        <h1 id="title">
          <span onclick="toggle_editable()" style="cursor: pointer;">Navigator</span>
        </h1>

        <div id="search_area">
          <input type="text" id="search_bar" name="search" onfocus="this.select()" onmouseup="preventDefault(event)" onkeypress='if(event.keyCode==13){window.open("https://www.google.com/search?q=" + $("#search_bar").val())}'>
        </div>

        <table id="navi_table" align="center">
          % idx = 0
          % for row in range(4):
            <tr>
              % for line in range(5):
              <td>
                % sn = "sn_{0}".format(idx)
                % item = sites_dict.get(sn, ["--", ""])
                % name = item[0]
                % site = item[1]
                <span class="cells" id="{{sn}}" url="{{site}}" onclick="cell_click('{{sn}}')">{{name}}</span>
              </td>
              % idx += 1
              % end
            </tr>
          % end
        </table>
      </div>

      <div id="footer">
        <div id="copyright"></div>
      </div>
    </div>

    <script type="text/javascript">
      $("#search_bar").focus();

      Copyright();
    </script>
  </body>
</html>


