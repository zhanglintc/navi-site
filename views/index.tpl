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
    <script type="text/javascript" src="./layer/layer.js?{{static_file_version}}"></script>

    <link rel="stylesheet" type="text/css" href="./css/common.css?{{static_file_version}}">

    <title>Navigator</title>
  </head>

  <body>
    <script type="text/javascript">
      function make_new_layer() {
        layer.open({
            id: "iframe_edit",
            type: 2,
            title: ["Edit", 'font-size: 14px;'],
            closeBtn: 0,
            moveEnd: function() {
                layer.close(layer.index);
            },
            shadeClose: false,
            resize: false,
            area: ['400px', '220px'],
            content: './layer_edit'
        });
      }
    </script>
    <div id="center_board">
      <h1 id="title">Navigator</h1>
      <table align="center">
        % for row in range(4):
          <tr>
            % for line in range(5):
            <td>
              <span onclick="make_new_layer()">Editable</span>
            </td>
            % end
          </tr>
        % end
      </table>

      <div id="copyright"></div>
    </div>

    <script type="text/javascript">
      function Copyright() {
        copyright.innerHTML =  "&copy 2018-" + (new Date()).getFullYear() + " by <a style='color: white;' target='_blank' href='http://github.com/zhanglintc/navi-site'>zhanglintc</a>";
        copyright.innerHTML += "<br>";
        copyright.innerHTML += "<a style='color: white; font-size: 10px;' target='_blank' href='http://www.miitbeian.gov.cn'>渝ICP备17002936号</a>";
      }
      Copyright();
    </script>
  </body>
</html>


