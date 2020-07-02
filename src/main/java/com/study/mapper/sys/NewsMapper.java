package com.study.mapper.sys;

import com.study.pojo.sys.News;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);

    //TODO 查询所有公告
    List<News> queryAllNews(News news);
}