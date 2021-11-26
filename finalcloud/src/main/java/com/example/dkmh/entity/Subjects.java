package com.example.dkmh.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name ="subjects")
public class Subjects {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length =128, nullable = false)
    private String nameSubject;

    @Column(length =128, nullable = false)
    private String categorySubject;

    @Column
    private Integer totalCredits;


}
