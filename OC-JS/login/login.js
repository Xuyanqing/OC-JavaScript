var login = function()
{
	var username = document.getElementById("username");
//	alert(username.value +" "+password.value);
//    调用oc的loginApp方法
    test.loginApp(username.value);
}

var nameAndpwd = function () {
    var username = document.getElementById("username");
    var password = document.getElementById("password");
//    alert(username.value +" "+password.value);
    test.logintest(username.value, password.value);
}
