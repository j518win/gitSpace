/*��װҳ����֤JSΪһ����CheckListClass()��ʵ�ֶ��б�ҳ��֤�Ļ�������
���ߣ�
���ڣ�2002/01/07
*/

// ʹ��˵��:
/* orNull �Ƿ�Ϊ��:  0 ��,1 �ǿ�;
 * Max ������ַ���: Ϊ0ʱ����Ҫ�ж�;
 * Sort �������:    0-�ַ�, 1-����, 2-��С��������, 3-���� ,4- �绰, 5-����, 6����, ��;
 * idList :         ���Id�б�;
 * nameList:        ����������б�;
*/

function CheckListClass()
{}

CheckListClass.prototype.checkInsert =checkInsert;
//��֤�б�ҳ--�޸�

/* ��֤������Ϣ���� */
//����˵��:
		/*  orNull ���Ƿ�Ϊ�յ�����
		 *	max ������ַ���
		 *  sort ������� (����,���ڵ�)
		 */ 
function checkInsert(idList,nameList,orNull,max,sort)  
{
	for(var i=0;i<orNull.length;i++)
	{
		if(orNull[i]==1)    							//����Ϊ��ʱ		
		{			
			if(doNull(idList[i],nameList[i]))                                   //�ǿ��ж�   
			{
			 
				if(sort[i] == 1)												//�����ж�
				{
					if(!doNum(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 2)												//float�ж�
				{
					if(!doFloat(idList[i],nameList[i]))									
						return false;
				}

				if(sort[i] ==3)													//�����ж�
				{
					if(!doDate(idList[i],nameList[i]))
						return false;
				}
						if(sort[i] ==4)													//�����жϣ���ʱ��ģ�
				{
					if(!doTime(idList[i],nameList[i]))
						return false;
				}	
				
				if(sort[i] == 5)												//�����ж�
				{
					if(!doEmail(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 7)												//�����ж�
				{
					if(!doChinese(idList[i],nameList[i]))									
						return false;
				}


			}
			else
				return false
			if(max[i]!=0)														//0ʱ����Ҫ�ж������ֵ
			{
			
				if(!doMax(idList[i],nameList[i],max[i]))						//����ж�
					return false;
			}
		}
		else												//��Ϊ��ʱ
		{
			
			
			var obj = eval("document.getElementById('" +idList[i]+"')");
			

			
			if(obj.value.length>0)												//��Ϊ�յ��û�������
			{ 
				if(sort[i] == 1)												//�����ж�
				{
					if(!doNum(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] == 2)												//float�ж�
				{
					if(!doFloat(idList[i],nameList[i]))									
						return false;
				}
				if(sort[i] ==3)													//�����ж�
				{
					if(!doDate(idList[i],nameList[i]))
						return false;
				}

					if(sort[i] ==4)													//�����жϣ���ʱ��ģ�
				{
					if(!doTime(idList[i],nameList[i]))
						return false;
				}	
				
				if(sort[i] == 5)												//�����ж�
				{
					if(!doEmail(idList[i],nameList[i]))									
						return false;
				}

				if(sort[i] == 7)												//�����ж�
				{
					if(!doChinese(idList[i],nameList[i]))									
						return false;
				}



				if(max[i]!=0)													//0ʱ����Ҫ�ж������ֵ
				{  
					
					if(!doMax(idList[i],nameList[i],max[i]))					//����ж�
						return false;
				}
			}

		}
	}
	return true;
	
}






//�ǿ��ж�
function doNull(id,cName)  
{ 
	
	var obj = eval("document.getElementById('"+id+"')")
	//var nullRegc = /\s/;//�ж����޿ո�
	if(obj.value.length<=0) 
	{	
		alert("��" + cName + "������Ϊ��ֵ��");
		obj.focus();
		return false;
	}
	else
		return true;
}

//����ж�
function doMax(id,cName,max)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length>max)
	{
		alert("��"+cName+"�����벻�ܴ���" + max +"�ַ���");
		obj.focus();
		return false;
	}
	else
		return true;
}

//��С�ж�
function doMin(id,cName,min)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length<min)
	{
		alert("��"+cName+"�����벻��С��" + min +"�ַ���");
		obj.focus();
		return false;
	}
	else
		return true;
}

//�����ж�
function doMaxMin(id,cName,num)  
{
	
	var obj = eval("document.getElementById('"+id+"')")
	if(obj.value.replace(/[^x00-xff]/g,"aa").length!=num)
	{
		alert("��"+cName+"������������" + num +"�ַ���");
		obj.focus();
		return false;
	}
	else
		return true;
}


//�����ж�
function doNum(id,cName)
{
	var obj = eval("document.getElementById('"+id+"')")
	if(isNaN(obj.value))
	{
		alert("��"+cName+"�����������֣�");
		obj.focus();
		return false;
	}
	else
		return true;
}
//�����ж�
function doDate(id,cName){
		var obj = eval("document.getElementById('"+id+"')");
		if(obj.value.length<8||obj.value.length>10){
			alert("��" + cName+"�������������");
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
				alert("��" + cName+"����ʽ����ȷ��");
				obj.focus();
				return false;
			}
			 iaDate = obj.value.toString().split(splitStr);
			 if(iaDate[0].length>=4){
				if(parseInt(iaDate[0])<1900 || parseInt(iaDate[0])>3000){
					 alert("��"+cName+"��������Χ̫�󣢣�---" +parseInt(iaDate[0]));
					 obj.focus();
					 return false;
				}
				if(iaDate[1]*1<1 || iaDate[1]*1>12){
					 alert("��"+cName+"���·ݲ���ȷ����--" + parseInt(iaDate[1]));
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
						alert("��"+cName+"���������31�죢��--" + parseInt(iaDate[2]));
						obj.focus();
						return false;
					}
				}
				if(yy==2){
					if(parseInt(iaDate[0])%4 == 0 && parseInt(iaDate[0])%100 != 0){
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>29){
							alert("��"+cName+"���������29�죢��--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
					}else{
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>29){
							alert("��"+cName+"���������28�죢��--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
					}
				}
				if(yy==4 || yy==6 || yy==9 || yy==11){
						if(parseInt(iaDate[2])<0 || parseInt(iaDate[2])>30){
							alert("��"+cName+"���������30�죢��--" + parseInt(iaDate[2]));
							obj.focus();
							return false;
						}
				}
			 }else{
				if(parseInt(iaDate[0])<1 || parseInt(iaDate[0])>12){
					 alert("��"+cName+"���·ݲ���ȷ����--" + parseInt(iaDate[0]));
					 obj.focus();
					 return false;
				}
				if(parseInt(iaDate[1])<1 || parseInt(iaDate[1])>31){
					 alert("��"+cName+"�����ڲ���ȷ����--" + parseInt(iaDate[1]));
					 obj.focus();
					 return false;
				}
				if(parseInt(iaDate[2])<1900 || parseInt(iaDate[2])>3000){
					 alert("��"+cName+"��������Χ̫�󣢣�--" + parseInt(iaDate[2]));
					 obj.focus();
					 return false;
				}

			}
		}
		if(c!=2){	
			alert("��"+cName+"����ʽ����ȷ��");
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
	
	{alert("��"+cName+"!����ʽ����ȷ��");
			obj.focus();
		return false; 
	}
return true;
}
//��֤������
function doFloat(id,cName)
{
	var obj = eval("document.getElementById('"+id+"')");
	var re=/^\d{1,8}$|\.\d{1,7}$/;                            
    var r=obj.value.match(re);
    if (r==null)
    {
        	alert("��"+cName+"����ʽ����ȷ��");
			obj.focus();
			return false;  
    }
    else{
           return true;
    }
}

//��֤����
	function doEmail(id,cName)
	{
		var obj = eval("document.getElementById('"+id+"')");
		var re=/^\w+@\w+\.\w{2,3}/;
        var r=obj.value.match(re);
        if (r==null)
         {
			alert("��"+cName+"����ʽ����ȷ��");
			obj.focus();
			return false;
          }

		else
			return true;
	}
//��֤����
	function doChinese(id,cName)
	{
		var obj = eval("document.getElementById('"+id+"')");
		var chineseRegc =  /^[^\x00-\x7f]+$/;
		if(chineseRegc.test(obj.value))
		{
			alert("��"+cName+"�������������ģ�");
			obj.focus();
			return false;
		}
		return true;
	}
	
//�ӿո�
	function addSpace(id)
	{
		var obj = eval("document.getElementById('"+id+"')");
		obj.value=obj.value+" ";
	}
	
	
	