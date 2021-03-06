<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>gwshop管理后台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link href="/Public/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- FontAwesome 4.3.0 -->
 	<link href="/Public/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 --
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/Public/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
    	folder instead of downloading all of them to reduce the load. -->
    <link href="/Public/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/Public/plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />   
    <!-- jQuery 2.1.4 -->
    <script src="/Public/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="/Public/js/global.js"></script>
    <script src="/Public/js/myFormValidate.js"></script>    
    <script src="/Public/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/Public/js/layer/layer-min.js"></script><!-- 弹窗js 参考文档 http://layer.layui.com/-->
    <script src="/Public/js/myAjax.js"></script>
    <script type="text/javascript">
    function delfunc(obj){
    	layer.confirm('确认删除？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
    		    // 确定
   				$.ajax({
   					type : 'post',
   					url : $(obj).attr('data-url'),
   					data : {act:'del',del_id:$(obj).attr('data-id')},
   					dataType : 'json',
   					success : function(data){
   						if(data==1){
   							layer.msg('操作成功', {icon: 1});
   							$(obj).parent().parent().remove();
   						}else{
   							layer.msg(data, {icon: 2,time: 2000});
   						}
   						layer.closeAll();
   					}
   				})
    		}, function(index){
    			layer.close(index);
    			return false;// 取消
    		}
    	);
    }
    
    function selectAll(name,obj){
    	$('input[name*='+name+']').prop('checked', $(obj).checked);
    }    
    </script>        
  </head>
  <body style="background-color:#ecf0f5;">
 

<div class="wrapper">
  <!-- Content Header (Page header) -->
  <div class="breadcrumbs" id="breadcrumbs">
	<ol class="breadcrumb">
	<?php if(is_array($navigate_admin)): foreach($navigate_admin as $k=>$v): if($k == '后台首页'): ?><li><a href="<?php echo ($v); ?>"><i class="fa fa-home"></i>&nbsp;&nbsp;<?php echo ($k); ?></a></li>
	    <?php else: ?>    
	        <li><a href="<?php echo ($v); ?>"><?php echo ($k); ?></a></li><?php endif; endforeach; endif; ?>          
	</ol>
</div>

  
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-list"></i> 文本回复
              <a href="<?php echo U('Admin/Wechat/add_text');?>"><button type="button" class="btn btn-info">
                  <i class="ace-icon fa fa-plus bigger-110"></i>
              </button></a> </h3>
        </div>
        <div class="panel-body">
          <div id="ajax_return">
              <div class="table-responsive">
                  <table class="table table-bordered table-hover">
                      <thead>
                      <tr>
                          <td style="width: 1px;" class="text-center">
                              <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
                          </td>
                          <td class="text-center">
                              关键词
                          </td>
                          <td class="text-center">
                              回答
                          </td>

                          <td class="text-center">操作</td>
                      </tr>
                      </thead>
                      <tbody>

                      <?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><tr>
                              <td class="text-center">
                                  <input type="checkbox" name="selected[]" value="<?php echo ($list["id"]); ?>">
                              </td>
                              <td class="text-center"><?php echo ($list["keyword"]); ?></td>
                              <td class="text-center"><?php echo ($list["text"]); ?></td>
                              <td class="text-center">
                                  <a href="<?php echo U('Admin/Wechat/add_text',array('id'=>$list['id'],'edit'=>1));?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="编辑"><i class="fa fa-pencil"></i></a>
                                  <a href="javascript:void(0);" data-href="<?php echo U('Admin/Wechat/del_text',array('id'=>$list['id']));?>" onclick="del('<?php echo ($list[id]); ?>',this)" id="button-delete6" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="删除"><i class="fa fa-trash-o"></i></a>
                              </td>
                          </tr><?php endforeach; endif; else: echo "" ;endif; ?>

                      </tbody>
                  </table>
              </div>
              <div class="row">
                  <div class="col-sm-6 text-left"></div>
                  <div class="col-sm-6 text-right"><?php echo ($page); ?></div>
              </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row --> 
  </section>
  <!-- /.content --> 
</div>
<!-- /.content-wrapper --> 
<script>
        // 删除操作
        function del(id,t)
        {
            if(!confirm('确定要删除吗?'))
                return false;

            location.href = $(t).data('href');
        }
</script> 
</body>
</html>