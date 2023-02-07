package hosinsa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import hosinsa.domain.ReviewVO;


public interface ReviewMapper {
	
		//	@Select("select *  from hosinsa_review where bno > 0") 
			
			public List<ReviewVO> getList();
			public void insert(ReviewVO vo);
			public void insertSelectKey(ReviewVO vo); //my batis 어노테이션,pk값을 미리 sql을 통해서 처리 후 특정이름으로 결과를 보여줌
			public ReviewVO read(Long bno); //pk가 처리함으로 bno타입정보로  처리
			public int delete(Long bno);
			public int update(ReviewVO vo);
			

}