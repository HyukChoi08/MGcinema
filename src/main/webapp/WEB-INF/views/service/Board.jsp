<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        #container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #contents {
            display: flex;
        }

        .col-aside {
            width: 250px;
            background-color: #f9f9f9;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .col-aside ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .col-aside ul li {
            margin-bottom: 10px;
        }

        .col-aside ul li a {
            text-decoration: none;
            color: black;
            font-size: 1em;
        }

        .col-aside ul li a:hover {
            text-decoration: underline;
        }

        .col-aside ul li.on a {
            font-weight: bold;
        }

        .board_view_area {
            flex: 1;
            padding: 20px;
        }

        .customer_top {
            margin-bottom: 20px;
        }

        .customer_top .tit {
            font-size: 24px;
            font-weight: bold;
        }

        .customer_top .stit {
            font-size: 14px;
            color: #666;
        }

        .board_view_area .top_title_faq {
            list-style: none;
            padding: 0;
        }

        .board_view_area .top_title_faq .title {
            font-size: 18px;
            font-weight: bold;
        }

        .board_view_area .top_title_faq .stit_area {
            font-size: 14px;
            color: #666;
            margin-top: 10px;
        }

        .board_view_area .view_area {
            margin-top: 20px;
            font-size: 16px;
            line-height: 1.6;
        }

        .customer_btn {
            margin-top: 20px;
        }

        .customer_btn button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 5px;
        }

        .customer_btn button:hover {
            opacity: 0.8;
        }

        .customer_btn button:focus {
            outline: none;
        }

        .btm_sup_list {
            margin-top: 20px;
        }

        .btm_sup_list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .btm_sup_list ul li {
            font-size: 14px;
            color: #666;
        }

        .btm_sup_list .stit {
            font-weight: bold;
        }

        .btm_sup_list .check_writ_area {
            font-size: 14px;
        }
        .customer_btn a {
    		text-decoration: none;
		}

		.customer_btn .btn-link button {
   			 background-color: #007bff;
   			 color: #fff;
  			 border: none;
   			 padding: 10px 20px;
   			 border-radius: 4px;
  			 font-size: 16px;
  			 cursor: pointer;
  			 margin: 0 5px;
		}
	
		.customer_btn .btn-link button:hover {
   			 opacity: 0.8;
		}

		.customer_btn .btn-link button:focus {
  	  	outline: none;
		}
    </style>
    <script src="#"></script> <!-- jQuery 라이브러리 -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btn_list').on('click', function () {
                Search();
            });

            function Search() {
                location.href = "/support/news/default.aspx?searchtext=" + encodeURIComponent("") + "&page=1&type=2&searchfield=0";
                return false;
            }
        });
    </script>
</head>
<body>
    <div id="container">
        <div id="contents">
            <!-- 고객센터 메뉴 -->
            <aside class="col-aside">
                <h2>고객센터 메뉴</h2>
                <ul>
                    <li><a href="serviceHome">고객센터 메인</a></li>
                    <li><a href="faq">자주찾는 질문</a></li>
                    <li class="on"><a href="news">공지/뉴스</a></li>
                    <li><a href="eaq">이메일 문의</a></li>
                </ul>
            </aside>

            <!-- 게시판 상세 내용 -->
            <div class="board_view_area">
                <div class="customer_top">
                    <h2 class="tit">공지/뉴스</h2>
                    <p class="stit">MG Cinema의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다ㅋ</p>
                </div>
                <ul class="top_title_faq">
                    <li class="title">[기타] 제목뭐로하지 </li>
                    <li class="stit_area">
                        <span>등록일<em class="regist_day">2024.08.09</em></span>
                        <span class="check_tit_area">조회수<em class="check_num">123123</em></span>
                    </li>
                </ul>
                <div class="view_area">
                    <p>안녕하십니까</p>
                    <p>MG cinema 유의사항 안내 드립니다.</p>
                    <p>&nbsp;</p>
                    <p>없어요</p>
                    <p>&nbsp;</p>
                    <p>감사합니다.</p>
                </div>
                <div class="customer_btn">
   					<a href="news" class="btn-link">
   					<button type="button"><span>목록</span></button>
   					</a>
   					
    				<button type="button" class="edit"><span>수정</span></button>
    				<button type="button" class="delete"><span>삭제</span></button>
				</div>

                <div class="btm_sup_list">
                    <ul class="line_sup_next">
                        <li class="stit">이전글</li>
                        <li class="name"><a href="#" class="txt">이전 글이 없습니다.</a></li>
                    </ul>
                    <ul class="line_sup_prev">
                        <li class="stit">다음글</li>
                        <li class="name"><a href="#" class="txt">부도났네;</a></li>
                        <li class="check_writ_area">등록일<span class="check_num">2024.05.16</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
