1. 新建marven项目
2. pom.xml: <packaging>war</packaging>
3. main目录下有java和resources, 再建立一个webapp
4. web.xml: <welcome-file>index.jsp</welcome-file>
5. index.jsp: 
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<div>
    <table>
        <tr>
            <th>序号</th>
            <th>指令名称</th>
            <th>描述</th>
        </tr>
        <tr>
            <td>1</td>
            <td>command1</td>
            <td>description1</td>
        </tr>
        <tr>
            <td>2</td>
            <td>command2</td>
            <td>description2</td>
        </tr>
    </table>
</div>

</body>
</html>
```
6. 创建servlet跳转index.jsp

```xml
<!-- 导入包 -->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
</dependency>
```

在`java.com.liuxin.servlet`下创建`ListServlet.java`

```java
@WebServlet(name = "ListServlet", urlPatterns = "/List.do")
public class ListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
```

7. 创建数据库
```sql
create database `test_db` character set utf8;
use `test_db`;

create table `message`(
  `id` int(11) not null auto_increment,
  `command` varchar(16) default null,
  `description` varchar(32) default null,
  `content` varchar(2048) default null,
  primary key (`id`)
);

insert into `message` values (1, '查看', '精彩内容', '这就是精彩内容');
insert into `message` values (2, '段子', '精彩段子', '哈哈哈');
insert into `message` values (3, '新闻', '今日头条', '汪峰');

SELECT * from message;
```

8. jdbc设置
要先在marven中引入mysql-connector包：
```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.13</version>
</dependency>
```
在ListServelet里加入jdbc设置：
```java
Class.forName("com.mysql.jdbc.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test_db","root","307715");
String sql = "select id,command,description,content from message";
PreparedStatement statement = conn.prepareStatement(sql);
ResultSet rs = statement.executeQuery();
```

9. 创建message实体类来存放ResultSet
在java.com.imooc.bean里创建Message.java
```java
public String id;
public String cmd;
public String dpn;
public String ctt;
和各自的getter和setter;
```

10. 在ListServelet里创建messageList
```java
List<Message> messageList = new ArrayList<Message>();
while (rs.next()) {
    Message message = new Message();
    message.setId(rs.getString("id"));
    message.setCmd(rs.getString("command"));
    message.setDpn(rs.getString("description"));
    message.setCtt(rs.getString("content"));
    messageList.add(message);
}
request.setAttribute("messageList",messageList);
```
这样就把messageList储存在request里了，第六步的`request.getRequestDispatcher("index.jsp").forward(request,response);`会把信息传给`index.jsp`

11. 在index.jsp中取messageList信息
marven中加入依赖：
```xml
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
```

index.jsp中第二行加入c-tag：
`<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>`

表格替换：
```jsp
<c:forEach items="${messageList}" var="message" varStatus="status">
    <tr>
        <td>${status.index+1}</td>
        <td>${message.cmd}</td>
        <td>${message.dpn}</td>
    </tr>
</c:forEach>
```

