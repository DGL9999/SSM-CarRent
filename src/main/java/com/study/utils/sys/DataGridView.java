package com.study.utils.sys;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用来将数据封装成普通Json格式的对象
 * @author Deja wu
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataGridView {

    private Integer code=0;
    private String msg="";
    private Long count;
    private Object data;

    /**
     * 用来加载 菜单管理左边树的构造器
     * @param data
     */
    public DataGridView(Object data) {
        this.data = data;
    }

    /**
     * 用来加载菜单管理数据表的构造器
     * @param count 用来传递分页信息
     * @param data
     */
    public DataGridView(Long count, Object data) {
        this.count = count;
        this.data = data;
    }
}
