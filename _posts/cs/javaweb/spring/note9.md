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
        doPost(request,response);
    }
}
```

