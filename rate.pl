use strict;
use warnings;
use Data::Dumper;

use constant EXCHANGE_RATE => 4; #換金率

use constant HIT_RATE     => 309; #抽選確率
use constant HIT_POINT    => 1;

use constant LOOP_COUNT   => 320000; #試行回数

use constant SUPER_RATE   => 40; 
use constant MIDDLE_RATE  => 20;
use constant NORMAL_RATE  => 40;

use constant AVERAGE_PAYOUT => 1700; 
use constant AVERAGE_PAYOUT_MIDDLE => 300;

use constant ROTATION   => 20; #回転数

my @hit_history_detail; #当選履歴_詳細
my @hit_history; #当選履歴
my $no_hit = 0;  #当選回転
my $hit_no = 0;  #当選回数
my $total_payout = 0;
my %total_tousen = ("kaku" => 0, "totsu" => 0, "normal" => 0);

main();

# 試行
sub main {

	for (my $i = 0; $i <= LOOP_COUNT; $i++){
	
		# 抽選
		my $result = int(rand(HIT_RATE));
	# print $result;
	
	  if (HIT_POINT == $result) {
      $hit_no++;
      push @hit_history, $no_hit;
	
      my $result_tousen = judge_tousen();

      $total_payout += payout($result_tousen);

      $no_hit = 0;
	  }
	
	  $no_hit++;
	
	#  print $i;
	}

}
	
#print Dumper @hit_history;
#print Dumper @hit_history_detail;

print "確:$total_tousen{kaku} 突:$total_tousen{totsu} 通:$total_tousen{normal}\n";

print "合計払い出し:$total_payout玉\n";

my $total_money = $total_payout * EXCHANGE_RATE;

print "合計金額 :$total_money円\n";

get_avg(@hit_history);

# 平均算出
sub get_avg {
  my @array = @_;
  my $total_num;
  my $count;

  foreach my $i(@array) {
    $total_num += $i;
    $count++;
  }

  my $purchase_money = ($total_num / ROTATION) * 1000;
  my $average_hit = $total_num / $count;
  my $difference = $total_money - $purchase_money;

  print "合計 : $total_num 当選数 : $count\n";
  print "平均当選確率 : $average_hit\n";
  print "投資金額 :$purchase_money円\n";
  print "差枚 :$difference円\n";

}

# 確突通判定
sub judge_tousen {
  my $result = int(rand(100));
  if (SUPER_RATE >= $result){
    $total_tousen{"kaku"}++;
    push @hit_history_detail, "SUPER";
    return "SUPER";
  } elsif (SUPER_RATE + MIDDLE_RATE >= $result){
    $total_tousen{"totsu"}++;
    push @hit_history_detail, "MIDDLE";
    return "MIDDLE";
  } else {
    $total_tousen{"normal"}++;
    push @hit_history_detail, "NORMAL";
    return "NORMAL";
  }
}

# 払い出し
sub payout {
  my $result_tousen;
  ($result_tousen) = @_;

  if ($result_tousen eq "SUPER") {
    $total_payout += AVERAGE_PAYOUT;
    payout(judge_tousen);
  } elsif ($result_tousen eq "MIDDLE") {
    $total_payout += AVERAGE_PAYOUT_MIDDLE;
    payout(judge_tousen);  
    return AVERAGE_PAYOUT_MIDDLE;
  } elsif ($result_tousen eq "NORMAL") {
    return AVERAGE_PAYOUT + 1250;
  } else {
    print "error";
    exit;
  }

}
