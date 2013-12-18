<?php if ($modules || isset($subcat)) { ?>
<div id="column-left">
    <?php
    if(isset($subcat)){ ?>
     <div class="categories">
        <ul class="unstyled">
    <?php foreach($subcat as $cat){ 
   
    if(isset($this->request->get['path']))
    {
    $path = explode("_",$this->request->get['path']);
    if(in_array($cat['id'],$path))
    {
       $selected = 'class="invarseColor left-second-level active"';
    }else{
       $selected = 'class="invarseColor left-second-level"';
    }
    }
    
    ?>
       <li>
       <a <?php echo $selected; ?> href="<?php echo $cat['href'];?>"><?php echo $cat['name'];?></a>
       </li>
        
      
    <?php } ?>
      </ul>
    </div>
<?php
    }
    
    
    ?>
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</div>
<?php } ?> 