package com.example.dkmh.entity;


import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name ="users")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length =128, nullable = false)
    private String username;

    @Column(length =64, nullable = false)
    private String password;


    @Column(name = "Enabled", length = 1, nullable = false)
    private boolean enabled;

    @Column(name="name", length =45 , nullable =true)
    private String fullName;

    @Column(name="class", length =45 , nullable =true)
    private String className;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name ="dkmh",
            joinColumns = @JoinColumn(name ="users_id"),
            inverseJoinColumns = @JoinColumn(name="subject_id")
    )
    private Set<Subjects> subject = new HashSet<>();


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name ="users_roles",
            joinColumns = @JoinColumn(name ="users_id"),
            inverseJoinColumns = @JoinColumn(name="role_id")
    )
    private Set<Roles> roles = new HashSet<>();
}
