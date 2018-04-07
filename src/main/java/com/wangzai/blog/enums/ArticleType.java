package com.wangzai.blog.enums;

/**
 * 文章类型 0:私密 1:公开 默认0
 */
public enum ArticleType {

    PRIVATE(0),
    PUBLIC(1);

    private Integer value;

    ArticleType(Integer value){
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
