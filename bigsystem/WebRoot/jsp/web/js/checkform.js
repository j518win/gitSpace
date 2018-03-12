/*封装页面验证JS为一个类CheckListClass()，实现对列表页验证的基本功能
作者：
日期：2002/01/07
*/

// 使用说明:
/* orNull 是否为空:  0 空,1 非空;
 * Max 域最大字符数: 为0时不需要判断;
 * Sort 域的类型:    0-字符, 1-数字, 2-带小数的数字, 3-日期 ,4- 电话, 5-信箱, 6连接, 等;
 * idList :         域的Id列表;
 * nameList:        域的中文名列表;
*/

function CheckListClass()
{}

CheckListClass.prototype.checkInsert =checkInsert;
//验证列表页--修改

/* 验证增加信息的域 */
//参数说明:
		/*  orNull 域是否为空的数组
		 *	max 域最大字符数
		 *  sort 域的类型 (数字,日期等)
		 */ 
function checkInsert(idList,nameList,orNull,max,sort)  
{
	for(var i=0;i<orNull.length;i++)
	{
		if(orNull[i]==1)    							//不可为空时		
		{			
			if(doNull(idList[i],nameList[i]))                                   //非空判断   
			{
			 
				if(sort[i] == 1)												//数字判断
				{
					if(!doNum(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 2)												//float判断
				{
					if(!doFloat(idList[i],nameList[i]))									
						return false;
				}

				if(sort[i] ==3)													//日期判断
				{
					if(!doDate(idList[i],nameList[i]))
						return false;
				}
						if(sort[i] ==4)													//日期判断（带时间的）
				{
					if(!doTime(idList[i],nameList[i]))
						return false;
				}	
				
				if(sort[i] == 5)												//邮箱判断
				{
					if(!doEmail(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 7)												//中文判断
				{
					if(!doChinese(idList[i],nameList[i]))									
						return false;
				}


			}
			else
				return false
			if(max[i]!=0)														//0时不需要判断最大数值
			{
			
				if(!doMax(idList[i],nameList[i],max[i]))						//最大判断
					return false;
			}
		}
		else												//可为空时
		{
			
			
			var obj = eval("document.getElementById('" +idList[i]+"')");
			

			
			if(obj.value.length>0)												//可为空但用户有输入
			{ 
				if(sort[i] == 1)												//数字判断
				{
					if(!doNum(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 2)												//float判断
				{
					if(!doFloat(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] ==3)													//日期判断
				{
					if(!doDate(idList[i],nameList[i]))
						return false;
				}

					if(sort[i] ==4)													//日期判断（带时间的）
				{
					if(!doTime(idList[i],nameList[i]))
						return false;
				}	
				
				if(sort[i] == 5)												//邮箱判断
				{
					if(!doEmail(idList[i],nameList[i]))									
						return false;
				}

				if(sort[i] == 7)												//中文判断
				{
					if(!doChinese(idList[i],nameList[i]))									
						return false;
				}



				if(max[i]!=0)													//0时不需要判断最大数值
				{  
					
					if(!doMax(idList[i],nameList[i],max[i]))					//最大判断
						return false;
				}
			}

		}
	}
	return true;
	
}






//非空判断
function doNull(id,cName)  
{ 
	
	var obj = eval("document.getElementById('"+id+"')")
	//var nullRegc = /\s/;//判断有无空格
	if(obj.value.length<=0) 
	{	
		alert("＂" + cName + "＂不能为空值！");
		obj.focus();
		return false;
	}
	else
		return true;
}

//最大判断
function doMax(id,cName,max)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length>max)
	{
		alert("＂"+cName+"＂输入不能大于" + max +"字符！");
		obj.focus();
		return false;
	}
	else
		return true;
}

//最小判断
function doMin(id,cName,min)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length<min)
	{
		alert("＂"+cName+"＂输入不能小于" + min +"字符！");
		obj.focus();
		return false;
	}
	else
		return true;
}

//长度判断
function doMaxMin(id,cName,num)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length!=num)
	{
		alert("＂"+cName+"＂输入必须等于" + num +"字符！");
		obj.focus();
		return false;
	}
	else
		return true;
}


//整数判断
function doNum(id,cName)
{
	var obj = eval("document.getElementById('"+id+"')")
	if(isNaN(obj.value))
	{
		alert("＂"+cName+"＂必须是数字！");
		obj.focus();
		return false;
	}
	else
		return true;
}
//日期判断
function doDate(id,cName){
		var obj = eval("document.getElementById('"+id+"')");
		if(obj.value.length<8||obj.value.length>10){
			alert("＂" + cName+"＂日期输入错误！");
			obj.focus();
			return false;
		}
		var c=0,splitStr,splitStr1;
		var iaDate = new Array(3)
		for(var t = 0;t<=obj.value.length-1;t++){	
			if( isNaN(obj.value.substring(t, t+1))){
				if(c==1){
					splitStr1 = obj.value.substring(t, t+1);
				}else{
					splitStr = obj.value.substring(t, t+1);
				}
				 c++;
			}
		}
		if(c==2){
			if(splitStr!=splitStr1){
				alert("＂" + cName+"＂格式不正确！");
				obj.focus();
				return false;
			}
			 iaDate = obj.value.toString().split(splitStr);
			 if(iaDate[0].length>=4){
				if(parseInt(iaDate[0])<1900 || parseInt(iaDate[0])>3000){
					 alert("＂"+cName+"的年数范围太大＂！---" +parseInt(iaDate[0]));
					 obj.focus();
					 return false;
				}
				if(iaDate[1]*1<1 || iaDate[1]*1>12){
					 alert("＂"+cName+"的月份不正确＂！--" + parseInt(iaDate[1]));
					 obj.focus();
					 return false;
				}
				var yy = parseInt(iaDate[1]);
				if(iaDate[1]=="08"){
				   yy=8;
				}
				if(iaDate[1]=="09"){
				   yy=9;
				}
				if(yy==1 || yy==3 || yy==5 || yy==7 || yy==8 || yy==10 || yy==12){
					if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>31){
						alert("＂"+cName+"的日期最多31天＂！--" + parseInt(iaDate[2]));
						obj.focus();
						return false;
					}
				}
				if(yy==2){
					if(parseInt(iaDate[0])%4 == 0 && parseInt(iaDate[0])%100 != 0){
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>29){
							alert("＂"+cName+"的日期最多29天＂！--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
					}else{
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>29){
							alert("＂"+cName+"的日期最多28天＂！--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
					}
				}
				if(yy==4 || yy==6 || yy==9 || yy==11){
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>30){
							alert("＂"+cName+"的日期最多30天＂！--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
				}
			 }else{
				if(parseInt(iaDate[0])<1 || parseInt(iaDate[0])>12){
					 alert("＂"+cName+"的月份不正确＂！--" + parseInt(iaDate[0]));
					 obj.focus();
					 return false;
				}
				if(parseInt(iaDate[1])<1 || parseInt(iaDate[1])>31){
					 alert("＂"+cName+"的日期不正确＂！--" + parseInt(iaDate[1]));
					 obj.focus();
					 return false;
				}
				if(parseInt(iaDate[2])<1900 || parseInt(iaDate[2])>3000){
					 alert("＂"+cName+"的年数范围太大＂！--" + parseInt(iaDate[2]));
					 obj.focus();
					 return false;
				}

			}
		}
		if(c!=2){	
			alert("＂"+cName+"＂格式不正确！");
			obj.focus();
			return false;
		}
	return true;
}
function doTime(id,cName)
{
	var obj = eval("document.getElementById('"+id+"')");
	str=obj.value;

var reg = /^(\d{1,4})(-|\/)(\d{2})\2(\d{2}) (\d{2}):(\d{2})$/; 
var r = str.match(reg); 
if(r==null)
	
	{alert("＂"+cName+"!＂格式不正确！");
			obj.focus();
		return false; 
	}
return true;
}
//验证浮点型
function doFloat(id,cName)
{
	var obj = eval("document.getElementById('"+id+"')");
	var re=/^\d{1,8}$|\.\d{1,7}$/;                            
    var r=obj.value.match(re);
    if (r==null)
    {
        	alert("＂"+cName+"＂格式不正确！");
			obj.focus();
			return false;  
    }
    else{
           return true;
    }
}

//验证信箱
	function doEmail(id,cName)
	{
		var obj = eval("document.getElementById('"+id+"')");
		var re=/^\w+@\w+\.\w{2,3}/;
        var r=obj.value.match(re);
        if (r==null)
         {
			alert("＂"+cName+"＂格式不正确！");
			obj.focus();
			return false;
          }

		else
			return true;
	}
//验证中文
	function doChinese(id,cName)
	{
		var obj = eval("document.getElementById('"+id+"')");
		var chineseRegc =  /^[^\x00-\x7f]+$/;
		if(chineseRegc.test(obj.value))
		{
			alert("＂"+cName+"＂不能输入中文！");
			obj.focus();
			return false;
		}
		return true;
	}
	
//加空格
	function addSpace(id)
	{
		var obj = eval("document.getElementById('"+id+"')");
		obj.value=obj.value+" ";
	}
	
	
	