package com.study.utils.sys;

import java.util.ArrayList;
import java.util.List;

/**
 * 将简单集合转换为有层级的集合
 * @author Deja wu
 */
public class TreeNodeBuilder {

    public static List<TreeNode> builder(List<TreeNode> nodes, Integer topPid) {
        //创建一个List容器来辅助操作
        List<TreeNode> treeNodes = new ArrayList();
        //嵌套foreach循环，
        // 将PID为1的作为根节点（0不显示在菜单上，所以不作为根节点）放入treeNodes，将其他节点放入对应父节点中
        for (TreeNode n1 : nodes) {
            if (n1.getPid() == topPid) {
                treeNodes.add(n1);
            }
            for (TreeNode n2 : nodes) {
                if (n2.getPid() == n1.getId()) {
                    n1.getChildren().add(n2);
                }
            }
        }
        return treeNodes;
    }
}
