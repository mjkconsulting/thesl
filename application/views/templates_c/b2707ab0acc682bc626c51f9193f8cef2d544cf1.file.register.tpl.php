<?php /* Smarty version Smarty-3.1.7, created on 2012-03-31 21:08:36
         compiled from "application/views/templates/register.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21063002064f6bbfa15ac1b6-72179764%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b2707ab0acc682bc626c51f9193f8cef2d544cf1' => 
    array (
      0 => 'application/views/templates/register.tpl',
      1 => 1333168101,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21063002064f6bbfa15ac1b6-72179764',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.7',
  'unifunc' => 'content_4f6bbfa172d3f',
  'variables' => 
  array (
    'phpself' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_4f6bbfa172d3f')) {function content_4f6bbfa172d3f($_smarty_tpl) {?><?php if (!is_callable('smarty_function_ci_language')) include '/Users/oren/www/api.thesl.com/application/libraries/smarty/libs/plugins/function.ci_language.php';
if (!is_callable('smarty_function_ci_form_validation')) include '/Users/oren/www/api.thesl.com/application/libraries/smarty/libs/plugins/function.ci_form_validation.php';
if (!is_callable('smarty_function_html_options')) include '/Users/oren/www/api.thesl.com/application/libraries/smarty/libs/plugins/function.html_options.php';
?><?php echo $_smarty_tpl->getSubTemplate ("header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('title'=>"Registration",'name'=>($_smarty_tpl->tpl_vars['title']->value)), 0);?>


<!-- user registration -->
<h2>User Registration:</h2>


<?php echo smarty_function_ci_language(array('file'=>"label",'lang'=>($_smarty_tpl->tpl_vars['lang']->value)),$_smarty_tpl);?>

<form action="<?php echo $_smarty_tpl->tpl_vars['phpself']->value;?>
" method="post">
<fieldset>
	<div class="form_label"><label for="fname"><?php echo smarty_function_ci_language(array('line'=>"fname"),$_smarty_tpl);?>
:</label></div>
	<input type="text" name="fname" id="fname" value="<?php echo smarty_function_ci_form_validation(array('field'=>'fname'),$_smarty_tpl);?>
" /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'fname','error'=>'true'),$_smarty_tpl);?>

	
	<div class="form_label"><label for="fname"><label for="lname"><?php echo smarty_function_ci_language(array('line'=>"lname"),$_smarty_tpl);?>
:</label></div>
	<input type="text" name="lname" id="lname" value="<?php echo smarty_function_ci_form_validation(array('field'=>'lname'),$_smarty_tpl);?>
" /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'lname','error'=>'true'),$_smarty_tpl);?>


	<div class="form_label"><label for="fname"><label for="email"><?php echo smarty_function_ci_language(array('line'=>"email"),$_smarty_tpl);?>
:</label></div>
	<input type="text" name="email" id="email" value="<?php echo smarty_function_ci_form_validation(array('field'=>'email'),$_smarty_tpl);?>
" /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'email','error'=>'true'),$_smarty_tpl);?>

	
	<div class="form_label"><label for="fname"><label for="password"><?php echo smarty_function_ci_language(array('line'=>"password"),$_smarty_tpl);?>
:</label></div>
	<input type="password" name="password" id="password" value="" /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'password','error'=>'true'),$_smarty_tpl);?>


	<div class="form_label"><label for="fname"><label for="passconf"><?php echo smarty_function_ci_language(array('line'=>"passconf"),$_smarty_tpl);?>
:</label></div>
	<input type="password" name="passconf" id="passconf" value="" /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'passconf','error'=>'true'),$_smarty_tpl);?>



	<?php echo smarty_function_ci_form_validation(array('field'=>'state','assign'=>'selected_state'),$_smarty_tpl);?>

	<div class="form_label"><label for="state"><?php echo smarty_function_ci_language(array('line'=>"state"),$_smarty_tpl);?>
:</label></div>
	<select name='state'>
	<?php echo smarty_function_html_options(array('values'=>($_smarty_tpl->tpl_vars['state_values']->value),'output'=>($_smarty_tpl->tpl_vars['state_output']->value),'selected'=>($_smarty_tpl->tpl_vars['selected_state']->value)),$_smarty_tpl);?>

	</select><br /><br />
	<?php echo smarty_function_ci_form_validation(array('field'=>'states','error'=>'true'),$_smarty_tpl);?>


	<input type="submit" name="action" value="submit" />
</form>

<?php echo $_smarty_tpl->getSubTemplate ("footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php }} ?>