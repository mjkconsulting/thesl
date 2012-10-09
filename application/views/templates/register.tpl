{include file="header.tpl" title="Registration" name="$title"}

<!-- user registration -->
<h2>User Registration:</h2>

{* multi language support *}
{ci_language file="label" lang="$lang"}
<form action="{$phpself}" method="post">
<fieldset>
	<div class="form_label"><label for="fname">{ci_language line="fname"}:</label></div>
	<input type="text" name="fname" id="fname" value="{ci_form_validation field='fname'}" /><br />
	{ci_form_validation field='fname' error='true'}
	
	<div class="form_label"><label for="fname"><label for="lname">{ci_language line="lname"}:</label></div>
	<input type="text" name="lname" id="lname" value="{ci_form_validation field='lname'}" /><br />
	{ci_form_validation field='lname' error='true'}

	<div class="form_label"><label for="fname"><label for="email">{ci_language line="email"}:</label></div>
	<input type="text" name="email" id="email" value="{ci_form_validation field='email'}" /><br />
	{ci_form_validation field='email' error='true'}
	
	<div class="form_label"><label for="fname"><label for="password">{ci_language line="password"}:</label></div>
	<input type="password" name="password" id="password" value="" /><br />
	{ci_form_validation field='password' error='true'}

	<div class="form_label"><label for="fname"><label for="passconf">{ci_language line="passconf"}:</label></div>
	<input type="password" name="passconf" id="passconf" value="" /><br />
	{ci_form_validation field='passconf' error='true'}


	{ci_form_validation field='state' assign='selected_state'}
	<div class="form_label"><label for="state">{ci_language line="state"}:</label></div>
	<select name='state'>
	{html_options values="$state_values" output="$state_output" selected="$selected_state"}
	</select><br /><br />
	{ci_form_validation field='states' error='true'}

	<input type="submit" name="action" value="submit" />
</form>

{include file="footer.tpl"}
