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

    <link rel="stylesheet" type="text/css" href="./css/common.css?{{static_file_version}}">

    <title>Navigator</title>
  </head>

  <body>
    <script type="text/javascript">
      function update_site_info() {
        parent.layer.close(parent.layer.index);
        parent.layer.msg("successfully saved!", {'time': 1000});
      }
    </script>

    <div id="center_board">
      <div id="center_center">
        <div class="info" style="margin-top: 5px">
          <span class="label">Name:</span>
        </div>

        <div class="info" style="margin-top: 5px">
          <input class="edit_area" id="disp_name" type="text">
        </div>

        <div class="info" style="margin-top: 5px">
          <span class="label">Site:</span>
        </div>

        <div class="info" style="margin-top: 5px">
          <input class="edit_area" id="site_addr" type="text">
        </div>

        <div id="btn_board" style="margin-top: 10px">
          <button class="btn" id="confirm" onclick="update_site_info()">Confirm</button>
          <button class="btn" id="cancel" onclick="parent.layer.close(parent.layer.index)">Cancel</button>
        </div>

        <div id="copyright"></div>
      </div>
    </div>
  </body>
</html>