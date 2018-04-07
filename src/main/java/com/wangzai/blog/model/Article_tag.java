package com.wangzai.blog.model;

import javax.persistence.*;

/**
 * 文章_标签关联表
 */
@Entity
@Table(name = "article_tag")
public class Article_tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer article_id;

    @Column
    private Integer tag_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArticle_id() {
        return article_id;
    }

    public void setArticle_id(Integer article_id) {
        this.article_id = article_id;
    }

    public Integer getTag_id() {
        return tag_id;
    }

    public void setTag_id(Integer tag_id) {
        this.tag_id = tag_id;
    }
}
