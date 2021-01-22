<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>数据分析柱状图</title>
    <LINK href="css.css" type=text/css rel=stylesheet>
     <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
     
        <script src="https://img.highcharts.com.cn/highcharts/highcharts.js"></script>
        <script src="https://img.highcharts.com.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
  </head>

  <body >

 
  <%
    Integer[][] scores=null;
    String[] titles=null;
    String url = ""; 
    String sql =  " select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join "+
    		"(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng "+
    		"left join cj as cj on cj.sjbh=sj.shijuanbianhao "+
    		"where cj.cj+cj.zcj<=60   GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng";
   ArrayList<HashMap> list0 = PageManager.getPages(url,15,sql, request); 
	int i=0;
	titles=new String[list0.size()];
	scores=new Integer[list0.size()][6];
	System.out.print("+++++++"+list0.size());
	for(HashMap map:list0){
		titles[i]=map.get("kemumingcheng").toString();
		Integer score=Integer.valueOf(map.get("cj").toString());
		//System.out.print(scores[0][i]+"======="+score);
		scores[i][0]=score;
	//out.print(map.get("danxuanti"));
	i++;
  }
  
	 sql =  " select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join "+
	    		"(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng "+
	    		"left join cj as cj on cj.sjbh=sj.shijuanbianhao "+
	    		"where cj.cj+cj.zcj<=70 and cj.cj+cj.zcj>60  GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng";
	   ArrayList<HashMap> list1 = PageManager.getPages(url,15,sql, request); 
	    i=0;
		//System.out.print("======="+list);
		for(HashMap map:list1){
			titles[i]=map.get("kemumingcheng").toString();
			Integer score=Integer.valueOf(map.get("cj").toString());
			scores[i][1]=score;
		//out.print(map.get("danxuanti"));
		i++;
	  }
	
		
			 sql =  " select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join "+
			    		"(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng "+
			    		"left join cj as cj on cj.sjbh=sj.shijuanbianhao "+
			    		"where cj.cj+cj.zcj<=80 and cj.cj+cj.zcj>70  GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng";
			   ArrayList<HashMap> list2 = PageManager.getPages(url,15,sql, request); 
			    i=0;
				//System.out.print("======="+list);
				for(HashMap map:list2){
					titles[i]=map.get("kemumingcheng").toString();
					Integer score=Integer.valueOf(map.get("cj").toString());
					scores[i][2]=score;
				//out.print(map.get("danxuanti"));
				i++;
			  }
				
				
				 sql =  " select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join "+
				    		"(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng "+
				    		"left join cj as cj on cj.sjbh=sj.shijuanbianhao "+
				    		"where cj.cj+cj.zcj<=90 and cj.cj+cj.zcj>80  GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng";
				   ArrayList<HashMap> list3 = PageManager.getPages(url,15,sql, request); 
				    i=0;
					//System.out.print("======="+list);
					for(HashMap map:list3){
						titles[i]=map.get("kemumingcheng").toString();
						Integer score=Integer.valueOf(map.get("cj").toString());
						scores[i][3]=score;
					//out.print(map.get("danxuanti"));
					i++;
				  }
					
					
					 sql =  " select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join "+
					    		"(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng "+
					    		"left join cj as cj on cj.sjbh=sj.shijuanbianhao "+
					    		"where cj.cj+cj.zcj<=200 and cj.cj+cj.zcj>90  GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng";
					   ArrayList<HashMap> list4 = PageManager.getPages(url,15,sql, request); 
					    i=0;
						//System.out.print("======="+list);
						for(HashMap map:list4){
							titles[i]=map.get("kemumingcheng").toString();
							Integer score=Integer.valueOf(map.get("cj").toString());
							scores[i][4]=score;
						//out.print(map.get("danxuanti"));
						i++;
					  }
  
  
						
						
						//测试打印
						for(int t=0;t<list0.size();t++){
							  for(int x=0;x<5;x++){
								 System.out.println("------:"+scores[t][x]);
							  }
							  System.out.println("------------");
						}
						
						
					/* 	select kmxx.kemumingcheng,ifnull(temp.cj,0) as cj from kemuxinxi  as kmxx   left join 
						(SELECT km.kemumingcheng,count(cj.cj+cj.zcj) cj FROM  kemuxinxi as km  left join shijuanshengcheng as sj  on sj.kemumingcheng=km.kemumingcheng
						left join cj as cj on cj.sjbh=sj.shijuanbianhao
						where cj.cj+cj.zcj<=90 and cj.cj+cj.zcj>80 GROUP BY km.kemumingcheng ) as temp   on kmxx.kemumingcheng=temp.kemumingcheng

						cj.cj+cj.zcj<=60
						cj.cj+cj.zcj<=70 and cj.cj+cj.zcj>60
						cj.cj+cj.zcj<=80 and cj.cj+cj.zcj>70
						cj.cj+cj.zcj<=90 and cj.cj+cj.zcj>80		 */			
  %>
 
 
 
  数据分析柱状图:
  <div id="container"  style="width:800px;height:400px:"></div>
  <% 
  /*
  int i=0;
	int j=0;						
    int yxrs=0;
    int bjgrs=0;   //0-60分
    double chengji=0;
	*/									
%>

  <script>
 var chart = Highcharts.chart('container',{
	chart: {
		type: 'column'//area,column,line,pie
	},
	title: {
		text: '各科成绩统计'
	},
	
	xAxis: {
		categories: [
			'0-60分','60-70分','70-80分','80-90分','90-100分'],
		crosshair: true
	},
	yAxis: {
		min: 0,
		title: {
			text: '学生人数'
		}
	},
	tooltip: {
		// head + 每个 point + footer 拼接成完整的 table
		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		'<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
		footerFormat: '</table>',
		shared: true,
		useHTML: true
	},
	plotOptions: {
		column: {
			borderWidth: 0
		}
	},
	series: [
		
		<%
		   for(i=0;i<titles.length;i++){
			   String str="{name:'"+titles[i]+"',"+"data: [";
			%>
			     <%	
			      for(int j=0;j<5;j++){
			       %>
			          
			          <%str=str+scores[i][j];%>
			          <%
			          if(j!=4){
			           %>	  
			        	 <%str=str+",";%>
			        <% 
			          }
			      } %>
			      <%str=str+"]}";%>
			    
			    eval(<%=str%>)
			<% 
			 if(i!=titles.length-1){
		           %>	  
		        	 ,
		   <%}
		   }
			%>
		
		
		/* , {
		name: 'c++程序设计',
		data: [3, 4, 1, 1, 2]
	}, {
		name: '数据结构',
		data: [1, 2, 4, 1, 3]
	}, {
		name: 'Java程序设计',
		data: [2, 4, 2, 1, 1]
	} */]
});

  </script>
  
<br><br>
  </body>
</html>


