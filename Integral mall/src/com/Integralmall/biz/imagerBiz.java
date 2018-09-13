package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.imagerDao;
import com.Integralmall.entity.imager;

public class imagerBiz {
	private imagerDao imagerdao;
	public ArrayList<imager> find(String suoshuneix,Integer No){
		return imagerdao.find(suoshuneix, No);
	}
	//查询所有
	public ArrayList<imager> findall(){
		return imagerdao.findall();
	}
	//删除图片
	public void Delimager(imager imager) {
		imagerdao.Delimager(imager);
	}
	//修改图片
	public void Updimager(imager imager) {
		imagerdao.Updimager(imager);
	}
	//增加图片
	public void Addimager(imager imager) {
			imagerdao.Addimager(imager);
	}
	public imagerDao getImagerdao() {
		return imagerdao;
	}

	public void setImagerdao(imagerDao imagerdao) {
		this.imagerdao = imagerdao;
	}
	
}
