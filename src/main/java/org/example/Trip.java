package org.example;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "trips")
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Trip_ID")
    private int tripId;

    @Column(name = "Trip_From")
    private String tripFrom;

    @Column(name = "Trip_To")
    private String tripTo;


    @Column(name = "Trip_StartDate")
    @Temporal(TemporalType.DATE)
    private Date tripStartDate;

    @Column(name = "Trip_EndDate")
    @Temporal(TemporalType.DATE)
    private Date tripEndDate;

    public Trip(){}

    public Trip(String tripFrom, String tripTo, Date tripStartDate, Date tripEndDate) {
        this.tripFrom = tripFrom;
        this.tripTo = tripTo;
        this.tripStartDate = tripStartDate;
        this.tripEndDate = tripEndDate;
    }
// Getters and setters

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public String getTripFrom() {
        return tripFrom;
    }

    public void setTripFrom(String tripFrom) {
        this.tripFrom = tripFrom;
    }

    public String getTripTo() {
        return tripTo;
    }

    public void setTripTo(String tripTo) {
        this.tripTo = tripTo;
    }

    public Date getTripStartDate() {
        return tripStartDate;
    }

    public void setTripStartDate(Date tripStartDate) {
        this.tripStartDate = tripStartDate;
    }

    public Date getTripEndDate() {
        return tripEndDate;
    }

    public void setTripEndDate(Date tripEndDate) {
        this.tripEndDate = tripEndDate;
    }
}
