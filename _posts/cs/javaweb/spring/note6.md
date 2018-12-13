#SSM框架：

## 【oa_dao】
java里三个文件夹：dao, entity, global
resources里配置文件：spring-dao.xml

### spring-dao.xml
1. 完整的配置文件里有**beans, context, aop, tx(事务), mvc**, 但这里只用基本的beans和context
2. 开启自动扫描，这样就可以在dao文件夹里用注解了
<context:component-scan base-package="com.imooc.oa.dao"/>
3. 配置dataSource
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
property name: **driverClassName, url, username, password**
4. 配置session工厂
<bean id="sessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
property name: **dataSource, typeAliasesPackage**
5. 配置mapper接口
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
property name: **sqlSessionFactoryBeanName, basePackage**
* 总结： 
<context:component-scan>, dataSource, sessionFactory, mapper

## 【oa_biz】
java里是事务接口和实现类
resources里配置文件：spring-biz.xml

### spring-biz.xml
1. 头文件需要**beans, context, aop, tx**
配置声明式事务
**声明式事务**封装在**业务层**的理由：
* dao文件夹每个方法里面都是**一个**持久化操作（添加一个报销单记录，或删除一个员工信息），封装成事务太细
* web文件夹每个方法里面都是**一个**请求，返回多个功能，封装成事务太粗
2. 引入dao配置文件
<import resource="spring-dao.xml"/>
3. 开启自动扫描
<context:component-scan base-package="com.imooc.oa.biz"/>
4. 使用aspectj自动代理
<aop:aspectj-autoproxy/>
5. 配置声明式事务
* 事务管理器transationManager
* 通知 tx:advice
* advice和cutpoint关联：aop:config

## 【oa_web】
java里三个文件夹：controller, dto, global
dto和entity类似：
entity是**java程序和数据库**进行数据传递而生成的对象
dto是**控制器和页面**进行数据传递而生成的对象
global放拦截器，过滤器等
resources里配置文件：spring-web.xml

### spring-web.xml配置
1. 不需要事务处理tx也不需要aop
2. 引入biz配置文件
<import resource="spring-biz.xml"/>
3. 自动扫描
<context:component-scan base-package="com.imooc.oa.controller"/>
<mvc:annotation-driven/>
4. 处理静态资源
<mvc:default-servlet-handler/>
5. 视图转换器
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
6. springMVC加载
* WEB-INF/web.xml
```xml
    <servlet>
        <servlet-name>SpringMVC</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:spring-web.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>SpringMVC</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
```

## 【其他文件】
1. 【oa_web】里的global文件夹添加编码过滤器：EncodingFilter.java
encodingFilter也可以直接使用spring提供的
然后在web.xml里添加<filter><filter-mapping>
2. 静态资源复制
把静态文件交给default处理，而不是springMVC
    <servlet-mapping>
        <servlet-name>default</servlet-name>
        <url-pattern>/assets/*</url-pattern>
        <url-pattern>/js/*</url-pattern>
        <url-pattern>/vendor/*</url-pattern>
        <url-pattern>*.js</url-pattern>
        <url-pattern>*.jpg</url-pattern>
        <url-pattern>*.gif</url-pattern>
        <url-pattern>*.png</url-pattern>
        <url-pattern>*.css</url-pattern>
    </servlet-mapping>
3. 【oa_dao】里的global文件夹添加常量类（数据字典）：Contant.java



## 部门管理
1. 在oa_dao里的entity文件夹中创建和数据库一一对应的实体类
Department.java里有sn, name, address
2. dao接口和Sql映射文件
在oa_dao里的dao文件夹中创建**DepartmentDao.java**接口
```java
@Repository("departmentDao")
public interface DepartmentDao {
    void insert(Department department);
    void update(Department department);
    void delete(String sn);
    Department select(String sn);
    List<Department> selectAll();
}
```
在oa_dao里的resources/dao(com...等和上面的接口文件必须一样)创建映射文件**DepartmentDao.xml**

```xml
<mapper namespace="com.imooc.oa.dao.DepartmentDao">
    <insert id="insert" parameterType="Department">
        insert into department values(#{sn},#{name},#{address})
    </insert>
    <delete id="delete" parameterType="String">
        delete from department where sn=#{sn}
    </delete>
    。。。
</mapper>
```
namespace就是接口的名字。
这里的id一定要和接口里面的方法名一致，
参数类型parameterType可以直接填Department, 不需要写包名
因为当时在**spring-dao.xml**里配置**sessionFactory**时我们写了
<property name="typeAliasesPackage" value="com.imooc.oa.entity"/>
#{sn},#{name},#{address}是Department.java的属性名，不是department表的字段名


