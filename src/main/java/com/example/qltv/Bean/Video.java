package com.example.qltv.Bean;

public class Video {
    private int id;
    private String videoname;
    private String videopath;
    private int iduser;
    private int status;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getVideoname() {
        return videoname;
    }
    public void setVideoname(String videoname) {
        this.videoname = videoname;
    }
    public String getVideopath() {
        return videopath;
    }
    public void setVideopath(String videopath) {
        this.videopath = videopath;
    }
    public int getIduser() {
        return iduser;
    }
    public void setIduser(int iduser) {
        this.iduser = iduser;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
}
