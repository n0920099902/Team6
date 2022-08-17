package com.ispan.team6.testForOders;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GoodPhotoService {

	@Autowired
	private GoodPhotoDao gDao;

	// 新增一筆
	public GoodPhoto insertPhoto(GoodPhoto gp) {
		return gDao.save(gp);
	}

	// 列出全部
	public List<GoodPhoto> getAllPhoto() {
		return gDao.findAll();
	}

	// 透過 id 找到 1 筆
	public GoodPhoto getPhotoById(Integer id) {
		Optional<GoodPhoto> optional = gDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

}
