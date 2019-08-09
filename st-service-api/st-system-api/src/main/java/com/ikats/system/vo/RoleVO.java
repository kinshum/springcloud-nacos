package com.ikats.system.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ikats.core.tool.node.INode;
import com.ikats.system.entity.Role;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;


import java.util.ArrayList;
import java.util.List;

/**
 * 视图实体类
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "RoleVO对象", description = "RoleVO对象")
public class RoleVO extends Role implements INode {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键ID
	 */
	private Integer id;

	/**
	 * 父节点ID
	 */
	private Integer parentId;

	/**
	 * 子孙节点
	 */
	@JsonInclude(JsonInclude.Include.NON_EMPTY)
	private List<INode> children;

	@Override
	public List<INode> getChildren() {
		if (this.children == null) {
			this.children = new ArrayList<>();
		}
		return this.children;
	}

	/**
	 * 上级角色
	 */
	private String parentName;
}
