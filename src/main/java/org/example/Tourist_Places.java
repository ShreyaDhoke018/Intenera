package org.example;

import jakarta.persistence.*;

@Entity
@Table(name="tourist_places")
public class Tourist_Places {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "place")
    private String place;

    @Column(name = "tourist_place1")
    private String tourist_place1;

    @Column(name = "tourist_place2")
    private String tourist_place2;

    @Column(name = "tourist_place3")
    private String tourist_place3;

    @Column(name = "tourist_place4")
    private String tourist_place4;

    @Column(name = "tourist_place5")
    private String tourist_place5;

    @Column(name = "tourist_place6")
    private String tourist_place6;

    @Column(name = "tourist_place7")
    private String tourist_place7;

    @Column(name = "tourist_place8")
    private String tourist_place8;

    @Column(name = "tourist_place9")
    private String tourist_place9;

    @Column(name = "tourist_place10")
    private String tourist_place10;

    public Tourist_Places() {}

    public Tourist_Places(String tourist_place10, String tourist_place9, String tourist_place8, String tourist_place7, String tourist_place6, String tourist_place5, String tourist_place4, String tourist_place3, String tourist_place2, String tourist_place1, String place, int id) {
        this.tourist_place10 = tourist_place10;
        this.tourist_place9 = tourist_place9;
        this.tourist_place8 = tourist_place8;
        this.tourist_place7 = tourist_place7;
        this.tourist_place6 = tourist_place6;
        this.tourist_place5 = tourist_place5;
        this.tourist_place4 = tourist_place4;
        this.tourist_place3 = tourist_place3;
        this.tourist_place2 = tourist_place2;
        this.tourist_place1 = tourist_place1;
        this.place = place;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getTourist_place1() {
        return tourist_place1;
    }

    public void setTourist_place1(String tourist_place1) {
        this.tourist_place1 = tourist_place1;
    }

    public String getTourist_place2() {
        return tourist_place2;
    }

    public void setTourist_place2(String tourist_place2) {
        this.tourist_place2 = tourist_place2;
    }

    public String getTourist_place3() {
        return tourist_place3;
    }

    public void setTourist_place3(String tourist_place3) {
        this.tourist_place3 = tourist_place3;
    }

    public String getTourist_place4() {
        return tourist_place4;
    }

    public void setTourist_place4(String tourist_place4) {
        this.tourist_place4 = tourist_place4;
    }

    public String getTourist_place5() {
        return tourist_place5;
    }

    public void setTourist_place5(String tourist_place5) {
        this.tourist_place5 = tourist_place5;
    }

    public String getTourist_place6() {
        return tourist_place6;
    }

    public void setTourist_place6(String tourist_place6) {
        this.tourist_place6 = tourist_place6;
    }

    public String getTourist_place7() {
        return tourist_place7;
    }

    public void setTourist_place7(String tourist_place7) {
        this.tourist_place7 = tourist_place7;
    }

    public String getTourist_place8() {
        return tourist_place8;
    }

    public void setTourist_place8(String tourist_place8) {
        this.tourist_place8 = tourist_place8;
    }

    public String getTourist_place9() {
        return tourist_place9;
    }

    public void setTourist_place9(String tourist_place9) {
        this.tourist_place9 = tourist_place9;
    }

    public String getTourist_place10() {
        return tourist_place10;
    }

    public void setTourist_place10(String tourist_place10) {
        this.tourist_place10 = tourist_place10;
    }
}
