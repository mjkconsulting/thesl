<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>The Seceret Language API (v.1.0)</title>

	{literal}
	<style type="text/css">

	::selection{ background-color: #E13300; color: white; }
	::moz-selection{ background-color: #E13300; color: white; }
	::webkit-selection{ background-color: #E13300; color: white; }

	body, tt {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	.param_name{
		float: left;
		width: 20%;
	}
	
	.param_desc{
		float: none;
		width: 80%;
	}
	
	.clear {
		float: none;
	}
		
	
	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body{
		margin: 0 15px 0 15px;
	}
	
	p.footer{
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	
	tt{
		font-weight: bold;
		margin-left: 0px;
	}
	
	h1.title {
		margin-left: 0px;
		padding-left: 0px;
	}
	
	#container{
		margin: 10px;
		border: 1px solid #D0D0D0;
		-webkit-box-shadow: 0 0 8px #D0D0D0;
	}
	
	body p strong {
		font-size: 110%;
		font-weight: bold;
	}
	
	.res_link, .res_link_lg {
		font-size: 102%;
		font-weight: bold;
	}
	
	.res_link_lg {
		font-size: 115%;
		font-weight: bold;
		font-spacing: 0.09em;
	}
	
	</style>
	{/literal}
</head>
<body>

<div id="container">
	<h1><strong>The Secret Language - API (v{$version|lower})</strong></h1>

	<div id="body">
		<p>This document outlines The Seceret Language API services. The API currently supports REST and SOAP protocols (v{$version}). Supported response formats: XML, JSON. (include the format extension, i.e: service.json)</p>

		<p>In order to get an API key please register at:</p>
		<code><a class="res_link_lg" href="http://api.thesl.com/register">http://api.thesl.com/register</a></code>
		<br/>
		<h1 class="title">REST Services</h1>
		<p><strong>GET /user/get - Returns User Data</strong></p>
		<p>Resource URL: <a href="res_link_lg">http://api.thesl.com/user/get.format</a></p>
		<code>
			<strong>Parameters (requires ONE of the following):</strong></br>
			<div class="param_name">user_id</div><div class="param_desc"> a valid user ID - [Int] (example: '1')</div>
			<div class="param_name">user_email</div><div class="param_desc"> a valid email address [String] (example: 'johns@gmail.com')</div>
			</br><strong>Returns: [Object Mixed] (user data)</strong>
		</code>
		</br>
		<p><strong>GET /user/save - Saves User Data</strong></p>
		<p>Resource URL: <a href="res_link">http://api.thesl.com/user/save.format</a></p>
		<code>
			<strong>Parameters:</strong></br>
			<div class="param_name">user_fname</div><div class="param_desc"> The user first name - [String] (example: 'james')</div>
			<div class="param_name">user_lname</div><div class="param_desc"> The user last name - [String] (example: 'smith')</div>
			<div class="param_name">user_email</div><div class="param_desc"> The user email address - [String] (example: 'jsmith@gmail.com')</div>
			<div class="param_name">user_username</div><div class="param_desc"> The selected username - [String] (example: 'jsm1th')</div>
			<div class="param_name">user_passwd</div><div class="param_desc"> The user selected password - [String] (example: 'jsm1th!')</div>
			<div class="param_name">user_dob</div><div class="param_desc"> The user date of birth - [Date yyyy-mm-dd] (example: '1980-01-20')</div>
			<div class="param_name">user_tob</div><div class="param_desc"> The user time of birth - [Time 00:00:00] (example: '01:00:00')</div>
			<div class="param_name">user_refid</div><div class="param_desc"> Referal ID - [Int] (example: '2')</div>
			<div class="param_name">user_created</div><div class="param_desc"> Creation date - [Date yyyy-mm-dd] (example: '2012-02-20')</div>
			<div class="param_name">user_phone</div><div class="param_desc"> The user phone number - [String xxx-xxx-xxxx] (example: '818-606-4500')</div>
			<div class="param_name">user_mobile</div><div class="param_desc"> The user mobile number - [String xxx-xxx-xxxx] (example: '818-607-4600')</div>
			<div class="param_name">user_status</div><div class="param_desc"> The user status - [Int] (example: '2')</div>
			<div class="param_name">user_icon</div><div class="param_desc"> The user selected icon - [String] (example: '1001343.jpg')</div>
			</br><strong>Returns: [Int] (1&lt;success | -1=failure)</strong>
		</code>
		</br>
		<p><strong>GET /user/update - Updates User Data</strong></p>
		<p>Resource URL: <a href="res_link">http://api.thesl.com/user/update.format</a></p>
		<code>
			<strong>Parameters:</strong></br>
			<div class="param_name">user_id</div><div class="param_desc"> The user ID to update - [Int] (example: '20')</div>
			<div class="param_name">user_fname</div><div class="param_desc"> The user first name - [String] (example: 'james')</div>
			<div class="param_name">user_lname</div><div class="param_desc"> The user last name - [String] (example: 'smith')</div>
			<div class="param_name">user_email</div><div class="param_desc"> The user email address - [String] (example: 'jsmith@gmail.com')</div>
			<div class="param_name">user_username</div><div class="param_desc"> The selected username - [String] (example: 'jsm1th')</div>
			<div class="param_name">user_passwd</div><div class="param_desc"> The user selected password - [String] (example: 'jsm1th!')</div>
			<div class="param_name">user_dob</div><div class="param_desc"> The user date of birth - [Date yyyy-mm-dd] (example: '1980-01-20')</div>
			<div class="param_name">user_tob</div><div class="param_desc"> The user time of birth - [Time 00:00:00] (example: '01:00:00')</div>
			<div class="param_name">user_refid</div><div class="param_desc"> Referal ID - [Int] (example: '2')</div>
			<div class="param_name">user_created</div><div class="param_desc"> Creation date - [Date yyyy-mm-dd] (example: '2012-02-20')</div>
			<div class="param_name">user_phone</div><div class="param_desc"> The user phone number - [String xxx-xxx-xxxx] (example: '818-606-4500')</div>
			<div class="param_name">user_mobile</div><div class="param_desc"> The user mobile number - [String xxx-xxx-xxxx] (example: '818-607-4600')</div>
			<div class="param_name">user_status</div><div class="param_desc"> The user status - [Int] (example: '2')</div>
			<div class="param_name">user_icon</div><div class="param_desc"> The user selected icon - [String] (example: '1001343.jpg')</div>
			</br><strong>Returns: [Int] (1=success | -1=failure)</strong>
		</code>
		</br>
		<p><strong>GET /user/enable - Activates a user</strong></p>
		<p>Resource URL: <a href="res_link">http://api.thesl.com/user/enable.format</a></p>
		<code>
			<strong>Parameters (requires ONE of the following):</strong></br>
			<div class="param_name">user_id</div><div class="param_desc"> a valid user ID - [Int] (example: '71') -- OR</div>
			<div class="param_name">user_email</div><div class="param_desc"> a valid email address [String] (example: 'johns@gmail.com')</div>
			</br><strong>Returns [Int] (1=success | -1=failure)</strong>
		</code>
		</br>
		<p><strong>GET /user/disable - Deactivates a user</strong></p>
		<p>Resource URL: <a href="res_link">http://api.thesl.com/user/disable.format</a></p>
		<code>
			<strong>Parameters (requires ONE of the following):</strong></br>
			<div class="param_name">user_id</div><div class="param_desc"> a valid user ID - [Int] (example: '71') -- OR</div>
			<div class="param_name">user_email</div><div class="param_desc"> a valid email address [String] (example: 'johns@gmail.com')</div>
			</br><strong>Returns: [Int] (1=success | -1=failure)</strong>
		</code>
		</br>
	</div>
	<br/>
	<p class="footer">&copy; 2012 The Secret Language LLC.</p>
</div>

</body>
</html>