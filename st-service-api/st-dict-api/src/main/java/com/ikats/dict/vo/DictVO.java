package com.ikats.dict.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.ikats.core.tool.node.INode;
import com.ikats.dict.entity.Dict;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;



import java.util.ArrayList;
import java.util.List;

/**
 * 视图实体类
 *
 * @author Chill
 * @since 2018-12-24
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "DictVO对象", description = "DictVO对象")
public class DictVO extends Dict implements INode {
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
	 * 上级字典
	 */
	private String parentName;
}
