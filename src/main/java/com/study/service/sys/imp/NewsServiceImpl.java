package com.study.service.sys.imp;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.study.mapper.sys.NewsMapper;
import com.study.pojo.sys.News;
import com.study.pojo.sys.User;
import com.study.service.sys.NewsService;
import com.study.utils.sys.DataGridView;
import com.study.utils.sys.WebUtils;
import com.study.vo.sys.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    //TODO 查询公告
    @Override
    public DataGridView queryAllNews(NewsVo newsVo) {
        Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
        List<News> data = this.newsMapper.queryAllNews(newsVo);
        return new DataGridView(page.getTotal(),data);
    }

   //TODO  添加公告
    @Override
    public void addNews(NewsVo newsVo) {
        //每次添加时，自动添加创建时间
        newsVo.setCreatetime(new Date());
        //每次添加时，自动添加操作人
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        newsVo.setOpername(user.getRealname());
        this.newsMapper.insertSelective(newsVo);
    }

    //TODO  修改公告
    @Override
    public void updateNews(NewsVo newsVo) {
        this.newsMapper.updateByPrimaryKeySelective(newsVo);
    }

    //TODO 删除公告
    @Override
    public void deleteNews(Integer newsId) {
        this.newsMapper.deleteByPrimaryKey(newsId);
    }

    //TODO 批量删除公告
    @Override
    public void deleteBatchNews(Integer[] ids) {
        for (Integer newsId : ids) {
            deleteNews(newsId);
        }
    }

    //TODO 通过ID查询公告
    @Override
    public News queryNewsById(Integer id) {
        return this.newsMapper.selectByPrimaryKey(id);
    }
}
