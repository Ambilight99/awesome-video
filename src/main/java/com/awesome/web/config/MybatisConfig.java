package com.awesome.web.config;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import java.util.Properties;

/**
 * @author adam
 * @ClassName MybatisConf
 * @Description mybatis配置
 * @create 2017/3/12 12:14
 */
@Configuration
@PropertySource("classpath:myBatis.properties")
public class MybatisConfig {
    @Value("${page.helper.offsetAsPageNum:true}")
    private String offsetAsPageNum;
    @Value("${page.helper.rowBoundsWithCounttrue:true}")
    private String rowBoundsWithCount;
    @Value("${page.helper.reasonable:true}")
    private String reasonable;

    @Bean
    public PageHelper pageHelper() {
        System.out.println("Mybatis分页组件PageHelper初始化完成");
        PageHelper pageHelper = new PageHelper();
        Properties p = new Properties();
        p.setProperty("offsetAsPageNum", offsetAsPageNum);
        p.setProperty("rowBoundsWithCount",rowBoundsWithCount);
        p.setProperty("reasonable", reasonable);
        pageHelper.setProperties(p);
        return pageHelper;
    }
}
