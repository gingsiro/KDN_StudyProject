package com.kdn.study.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.kdn.study.domain.RsvCode;

public class TimeCheck {

	public static String dayCheck() {

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd",
				Locale.KOREA);
		Date currentTime = new Date();
		String today = mSimpleDateFormat.format(currentTime);

		return today;

	}

	public static int timeCodeCheck(String roomResvDate, String today,
			List<RsvCode> timecodeTable) {
		int rsvcode = 0;

		int compare = today.compareTo(roomResvDate);

		if (compare == 0) { // 오늘
			Calendar cal = Calendar.getInstance();
			int hour = cal.get(Calendar.HOUR_OF_DAY);

			for (int i = 0; i < timecodeTable.size(); i++) {
				if (hour >= timecodeTable.get(i).getStarttime()
						&& hour < timecodeTable.get(i).getEndtime()) {
					rsvcode = (timecodeTable.get(i).getRsvcode()) + 1;
					break;
				}
			}
		} else if (compare == 1) { // 오늘 이전날짜 전부
			rsvcode = 7;
		}

		return rsvcode;
	}

}
