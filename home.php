<?php
include 'admin/db_connect.php';

if(isset($_POST['filter'])){
    $venue_id = $_POST['venue_id'];
    $date = $_POST['date'];
    $keyword = $_POST['keyword'];

    $sql = "SELECT e.*,v.venue FROM events e inner join venue v on v.id=e.venue_id where date_format(e.schedule,'%Y-%m%-d') >= '".date('Y-m-d')."' and e.type = 1 ";

    $conditions = array();

    if(!empty($venue_id)){
        $conditions[] = "e.venue_id = $venue_id";
    }

    if(!empty($date)){
        $conditions[] = "date_format(e.schedule,'%Y-%m-%d') = '$date'";
    }

    if(!empty($keyword)){
        $conditions[] = "e.event like '%$keyword%'";
    }

    if(!empty($conditions)){
        $sql .= " and ".implode(" and ", $conditions);
    }

    $sql .= " order by unix_timestamp(e.schedule) asc";

    $event = $conn->query($sql);
}
else{
    $event = $conn->query("SELECT e.*,v.venue FROM events e inner join venue v on v.id=e.venue_id where date_format(e.schedule,'%Y-%m%-d') >= '".date('Y-m-d')."' and e.type = 1 order by unix_timestamp(e.schedule) asc");
}
?>

<style>
#portfolio .img-fluid{
    width: calc(100%);
    height: 30vh;
    z-index: -1;
    position: relative;
    padding: 1em;
}
span.hightlight{
    background: yellow;
}
.banner{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 26vh;
        width: calc(30%);
    }
    .banner img{
        width: calc(100%);
        height: calc(100%);
        cursor :pointer;
    }
.event-list{
cursor: pointer;
border: unset;
flex-direction: inherit;
}
.event-list .banner {
    width: calc(40%)
}
.event-list .card-body {
    width: calc(50%)
}
.event-list .banner img {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    min-height: 50vh;
}
span.hightlight{
    background: yellow;
}
.banner{
   min-height: calc(100%)
}
</style>
        <header class="masthead">
            <div class="container-fluid h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end mb-4 page-title">
                    	<h3 class="text-white">Welcome to <?php echo $_SESSION['system']['name']; ?></h3>
                        <hr class="divider my-4" />

                    <div class="col-md-12 mb-2 justify-content-center">
                    </div>                        
                    </div>
                    
                </div>
            </div>
        </header>
            <div class="container-fluid mt-3 pt-2">
                <h4 class="text-center text-white">Upcoming Event</h4>
                <hr class="divider">
                <div class="container-fluid mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 15px;">
            <div class="container">             
                        <form method="post">
                            <div class="row g-2">
                                <div class="col-md-4">
                                    <select name="venue_id" id="" class="custom-select select2">
                                        <option value=""></option>
                                        <?php
                                            $artist = $conn->query("SELECT * FROM venue order by venue asc");
                                            while($row=$artist->fetch_assoc()):
                                        ?>
                                            <option value="<?php echo $row['id'] ?>" <?php echo isset($venue_id) && $venue_id == $row['id'] ? "selected" : '' ?>><?php echo ucwords($row['venue']) ?></option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>           
                                <div class="col-md-4">
                                    <input type="date" name="date" class="form-control" value="<?php echo isset($date) ? $date : '' ?>"> 
                                </div>                       
                                <div class="col-md-4">
                                    <input type="text" class="form-control" name="keyword" placeholder="Enter Keyword" value="<?php echo isset($keyword) ? $keyword : '' ?>">
                                </div>
                            </div>
                                <br>
                                <button type="submit" name="filter" class="btn btn-primary float-right">Apply Filter</button>
                        </form>
            </div>
        </div>
                <div class="row-items">
                <div class="col-lg-12">
                    <div class="row">                       
                <?php
                while($row = $event->fetch_assoc()):
                    $trans = get_html_translation_table(HTML_ENTITIES,ENT_QUOTES);
                    unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                    $desc = strtr(html_entity_decode($row['description']),$trans);
                    $desc=str_replace(array("<li>","</li>"), array("",","), $desc);
                ?>
                <div class="col-md-6" style="padding: 15px;">
                <div class="card event-list" data-id="<?php echo $row['id'] ?>">
                     <div class='banner'>
                        <?php if(!empty($row['banner'])): ?>
                            <img src="admin/assets/uploads/<?php echo($row['banner']) ?>" alt="">
                        <?php endif; ?>
                    </div>
                    <div class="card-body">
                        <div class="row  align-items-center justify-content-center text-center h-100">
                            <div class="">
                                <h3><b class="filter-txt"><?php echo ucwords($row['event']) ?></b></h3>
                                <div><small><p><b><i class="fa fa-calendar"></i> <?php echo date("F d, Y h:i A",strtotime($row['schedule'])) ?></b></p></small></div>
                                <div><small><p><b><i class="fa fa-map"></i> <?php echo ($row['venue']) ?></b></p></small></div>
                                <hr>
                                <larger class="truncate filter-txt"><?php echo strip_tags($desc) ?></larger>
                                <br>
                                <hr class="divider"  style="max-width: calc(80%)">
                                <button class="btn btn-primary float-right read_more" data-id="<?php echo $row['id'] ?>">More Detail</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <br>
                <?php endwhile; ?>
                </div>
                </div>
                </div>
            </div>           
<script>
     $('.read_more').click(function(){
         location.href = "index.php?page=view_event&id="+$(this).attr('data-id')
     })
     $('.banner img').click(function(){
        viewer_modal($(this).attr('src'))
    })
    $('#filter').keyup(function(e){
        var filter = $(this).val()

        $('.card.event-list .filter-txt').each(function(){
            var txto = $(this).html();
            txt = txto
            if((txt.toLowerCase()).includes((filter.toLowerCase())) == true){
                $(this).closest('.card').toggle(true)
            }else{
                $(this).closest('.card').toggle(false)
               
            }
        })
    })
</script>