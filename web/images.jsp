<%--
  User: 张建平
  Date: 2018/9/3
  Time: 9:37
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>文件上传</title>
    <script>
        function run(input_file, get_data){
          /*input_file：文件按钮对象*/
          /*get_data: 转换成功后执行的方法*/

            if ( typeof(FileReader) === 'undefined' ){
                alert("抱歉，你的浏览器不支持FileReader，不能将图片转换为Base64，请使用现代浏览器操作！");
            } else {
                try{
                  /*图片转Base64 核心代码*/
                    var file = input_file.files[0];
                    //这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件
                    if(!/image\/\w+/.test(file.type)){
                        //alert("请确保文件为图像类型");
                        return false;
                    }
                    var reader = new FileReader();
                    reader.onload = function(){
                        get_data(this.result);
                    }
                    reader.readAsDataURL(file);
                }catch (e){
                    alert('图片转Base64出错啦！'+ e.toString())
                }
            }
        }

        //
        $(function () {
            $("#myfile").change(function () {
                run(this, function (data) {

                    $('img').attr('src',data);
                    $('textarea').val(data);
                    $('#base64Img').val(data);
                });
            });
        });
    </script>
  </head>
  <body>

  <input id="myfile" type="file">
  <hr>
  预览：<br/>

    <img style="max-height: 300px; height: 8em; min-width:8em;">

    <hr>


    <textarea  style="display: block; width: 100%;height: 30em;"></textarea>

    <input type="hidden" id="base64Img">

  <hr>

  <!--
   默认表单提交的类型：application/x-www-form-urlencoded (不能做文件上传)
   文件上传的表单类型：multipart/form-data (能做文件上传，但不支持一般字段的提交)
   -->
  <form action="servlet/fileUpload" method="post" enctype="multipart/form-data">
    <%--用户名: <input type="text" name="username" value="admin">--%>

    文件：<input type="file" name="upfile"/>

    <%--<input type="hidden" name="myFile">--%>
      <button type="submit">上传</button>
  </form>

  <img src="" alt="">

  </body>
</html>
