package com.study.utils.bus;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * 将简单集合转换为有层级的集合的辅助类
 * @author Deja wu
 */
@Data
@NoArgsConstructor
public class TreeNode {
    private Integer id;
    @JsonProperty("parentId")
    private Integer pid;

    private String title;
    private String icon;
    private String href;
    private Boolean spread;
    private String target;
    private List<TreeNode> children = new ArrayList<TreeNode>();

    //复选树的必要属性
    private String checkArr="0"; //选中即为1

    /**
     *  菜单管理页面 -- 下拉树
     * @param id  与pid一起，用来构成标准JSON的层级结构
     * @param pid 与id一起，用来构成标准JSON的层级结构
     * @param title
     * @param icon
     * @param href
     * @param spread
     * @param target
     */
    public TreeNode(Integer id, Integer pid, String title, String icon, String href, Boolean spread, String target) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.icon = icon;
        this.href = href;
        this.spread = spread;
        this.target = target;
    }

    /**
     * 角色管理页面-- 分配菜单树  复选树
     * @param id
     * @param pid
     * @param title
     * @param spread
     * @param checkArr
     */
    public TreeNode(Integer id, Integer pid, String title, Boolean spread, String checkArr) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.spread = spread;
        this.checkArr = checkArr;
    }
}
