package com.minsiyao.entity;

import java.util.List;

public class Paging {
    private Integer page;       //当前页码
    private Integer total;      //总页数
    private Integer records;    //总条数
    private List<User> rows;    //数据
    private Integer rowNum = 5;  //每页行数

    @Override
    public String toString() {
        return "Paging{" +
                "page=" + page +
                ", total=" + total +
                ", records=" + records +
                ", rows=" + rows +
                ", rowNum=" + rowNum +
                '}';
    }

    public Integer getRowNum() {
        return rowNum;
    }

    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }

    public Paging(Integer page, Integer total, Integer records, List<User> rows, Integer rowNum) {
        this.page = page;
        this.total = total;
        this.records = records;
        this.rows = rows;
        this.rowNum = rowNum;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public Integer getRecords() {
        return records;
    }

    public void setRecords(Integer records) {
        this.records = records;
        this.total = records%rowNum==0?records/rowNum:records/rowNum+1;
    }

    public List<User> getRows() {
        return rows;
    }

    public void setRows(List<User> rows) {
        this.rows = rows;
    }



    public Paging() {
    }
}
