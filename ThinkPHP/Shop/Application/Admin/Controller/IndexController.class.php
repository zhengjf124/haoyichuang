<?php
namespace Admin\Controller;


class IndexController extends BaseController
{   

    public function index()
    {
        $this->assign('fTitle','首页');
        $act_list = session('act_list');
        $menu_list = $this->getRoleMenu($act_list);
        $this->assign('menu_list',$menu_list);
        $admin_info = getAdminInfo(session('admin_id'));
        //$order_amount = M('order')->where(array('order_status'=>0))->count();
       //$this->assign('order_amount',$order_amount);
        $this->assign('admin_info',$admin_info);
        //print_r($admin_info);
        $this->display();

    }

    public function welcome(){
        $this->assign('sys_info',$this->get_sys_info());
        $today = strtotime("-1 day");
        $count['handle_order'] = M('order')->where("add_time>$today ".C('WAITSEND'))->count();//待发货订单
        $count['new_order'] = M('order')->where("add_time>$today")->count();//今天新增订单
        $count['goods'] =  M('goods')->where("1=1")->count();//商品总数
        $count['article'] =  M('article')->where("1=1")->count();//文章总数
        $count['users'] = M('user')->where("1=1")->count();//会员总数
        $count['today_login'] = M('user')->where("last_login>$today")->count();//今日访问
        $count['new_users'] = M('user')->where("reg_time>$today")->count();//新增会员
        $count['comment'] = M('comments')->where("status=0")->count();//最新评论
        $this->assign('count',$count);
        $this->display();
    }

    public function get_sys_info(){
        $sys_info['os']             = PHP_OS;
        $sys_info['zlib']           = function_exists('gzclose') ? 'YES' : 'NO';//zlib
        $sys_info['safe_mode']      = (boolean) ini_get('safe_mode') ? 'YES' : 'NO';//safe_mode = Off
        $sys_info['timezone']       = function_exists("date_default_timezone_get") ? date_default_timezone_get() : "no_timezone";
        $sys_info['curl']			= function_exists('curl_init') ? 'YES' : 'NO';
        $sys_info['web_server']     = $_SERVER['SERVER_SOFTWARE'];
        $sys_info['phpv']           = phpversion();
        $sys_info['ip'] 			= GetHostByName($_SERVER['SERVER_NAME']);
        $sys_info['fileupload']     = @ini_get('file_uploads') ? ini_get('upload_max_filesize') :'unknown';
        $sys_info['max_ex_time'] 	= @ini_get("max_execution_time").'s'; //脚本最大执行时间
        $sys_info['set_time_limit'] = function_exists("set_time_limit") ? true : false;
        $sys_info['domain'] 		= $_SERVER['HTTP_HOST'];
        $sys_info['memory_limit']   = ini_get('memory_limit');
        $sys_info['version']   	    = file_get_contents('./Application/Admin/Conf/version.txt');
        $mysqlinfo = M()->query("SELECT VERSION() as version");
        $sys_info['mysql_version']  = $mysqlinfo['version'];
        if(function_exists("gd_info")){
            $gd = gd_info();
            $sys_info['gdinfo'] 	= $gd['GD Version'];
        }else {
            $sys_info['gdinfo'] 	= "未知";
        }
        return $sys_info;
    }

    public function getRoleMenu($act_list)
    {
        $modules = $roleMenu = array();
        $rs = M('system_module')->where('level>1 AND visible=1')->order('mod_id ASC')->select();

        if($act_list=='all'){
            foreach($rs as $row){
                if($row['level'] == 3){
                    $row['url'] = U("Admin/".$row['ctl']."/".$row['act']."");
                    $modules[$row['parent_id']][] = $row;//子菜单分组
                }
                if($row['level'] == 2){
                    $pmenu[$row['mod_id']] = $row;//二级父菜单
                }
            }
        }else{
            $act_list = explode(',', $act_list);
            foreach($rs as $row){
                if(in_array($row['mod_id'],$act_list)){
                    $row['url'] = U("Admin/".trim($row['ctl'])."/".$row['act']."");
                    $modules[$row['parent_id']][] = $row;//子菜单分组
                }
                if($row['level'] == 2){
                    $pmenu[$row['mod_id']] = $row;//二级父菜单
                }
            }
        }
        $keys = array_keys($modules);//导航菜单
        foreach ($pmenu as $k=>$val){
            if(in_array($k, $keys)){
                $val['submenu'] = $modules[$k];//子菜单
                $roleMenu[] = $val;
            }
        }

        return $roleMenu;
    }

    /**
     * ajax 修改指定表数据字段  一般修改状态 比如 是否推荐 是否开启 等 图标切换的
     * table,id_name,id_value,field,value
     */
    public function changeTableVal(){
        $table = I('table'); // 表名
        $id_name = I('id_name'); // 表主键id名
        $id_value = I('id_value'); // 表主键id值
        $field  = I('field'); // 修改哪个字段
        $value  = I('value'); // 修改字段值
        M($table)->where("$id_name = $id_value")->save(array($field=>$value)); // 根据条件保存修改的数据
    }








}