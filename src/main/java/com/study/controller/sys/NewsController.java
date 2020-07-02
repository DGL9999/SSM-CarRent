package com.study.controller.sys;

import com.study.pojo.sys.News;
import com.study.service.sys.NewsService;
import com.study.utils.sys.DataGridView;
import com.study.utils.sys.ResultObj;
import com.study.vo.sys.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 公告管理控制器
 *
 * @author Deja wu
 */

@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;
    
    //TODO 加载公告列表
    @RequestMapping("loadAllNews")
    public DataGridView loadNewsMangerList(NewsVo newsVo) {
        return this.newsService.queryAllNews(newsVo);
    }

    //TODO 添加公告
    @RequestMapping("addNews")
    public ResultObj addNews(NewsVo newsVo) {

        try {
            this.newsService.addNews(newsVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    //TODO 修改公告
    @RequestMapping("updateNews")
    public ResultObj updateNews(NewsVo newsVo) {
        try {
            this.newsService.updateNews(newsVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UpDATE_ERROR;
        }
    }

    //TODO 删除公告
    @RequestMapping("deleteNews")
    public ResultObj deleteNews(NewsVo newsVo) {
        try {
            this.newsService.deleteNews(newsVo.getId());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 批量删除公告
    @RequestMapping("deleteBatchNews")
    public ResultObj deleteBatchNews(NewsVo newsVo) {
        try {
            this.newsService.deleteBatchNews(newsVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_SUCCESS;
        }
    }

    //TODO 通过ID查询公告
    @RequestMapping("loadNewsById")
    public News loadNewsById(Integer id){
        return this.newsService.queryNewsById(id);
    }

}
