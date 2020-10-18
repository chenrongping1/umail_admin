export default function (time) {

        let begin=Number(time[0]) ;
        let end=Number(time[1]) ;
        let now=new Date().getTime()

        //判断活动是否开始
        if(now-begin<0){
            return  '活动还未开始'
        }

        //判断时间已经过期
        if(now-end>0){
            return  '活动已结束'
        }

        //判断时间
        var minusTime = (new Date(Number(time[1]))- (new Date())) ;
        var days = parseInt(minusTime / 86400000); 
        var hours = parseInt((minusTime % 86400000) / 3600000);
        var minutes = parseInt((minusTime % 3600000) / 60000);
        var seconds = parseInt((minusTime % 60000) / 1000);
        function checkTime(i) {
            if (i < 10) {
                return '0' + i;
            }else {
                return i;
            }
        }
        days = checkTime(days);
        hours = checkTime(hours);
        minutes = checkTime(minutes);
        seconds = checkTime(seconds);
   
         return  `${days}天${hours}小时${minutes}分${seconds}秒`
  
     

    
}