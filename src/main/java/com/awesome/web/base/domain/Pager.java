package com.awesome.web.base.domain;

import com.github.pagehelper.Page;

/**
 * @author adam
 * @ClassName Pager
 * @Description 分页对象
 * @create 2017/3/12 17:19
 */
public class Pager{
    private int pageNum=1;  //默认起始页为1
    private int pageSize=10;//默认每页大小为10

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum==0?1:pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize==0?10:pageSize;
    }
}
