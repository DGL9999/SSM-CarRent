package com.study.service.sys;

import com.study.pojo.sys.News;
import com.study.utils.sys.DataGridView;
import com.study.vo.sys.NewsVo;


public interface NewsService {


    /**
     * 查询所有公告
     * @param newsVo 这个视图对象中带有分页的参数
     * @return 返回一个简单json格式，给角色管理
     */
    DataGridView queryAllNews(NewsVo newsVo);

     /**
     * 添加公告
     * @param newsVo
     */
    void addNews(NewsVo newsVo);

    /**
     * 修改公告
     * @param newsVo
     */
    void updateNews(NewsVo newsVo);

    /**
     * 根据ID删除公告
     * @param newsId
     */
    void deleteNews(Integer newsId);

    /**
     * 批量删除公告
     * @param ids
     */
    void deleteBatchNews(Integer[] ids);

    /**
     * 通过ID查询公告
     * @param id
     * @return
     */
    News queryNewsById(Integer id);
}
