<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/">e-Signature</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
      <?php if (isset($username) && $username != "sunrise@ccrm-pro.com"): ?>
      <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'forms')? 'active' : '' ?>"><a href="/forms"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'forms')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Assets Movement</a></li>
      <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'plans')? 'active' : '' ?>"><a href="/plans"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'plans')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Plan List Approval (Project &amp; Replacement)</a></li>
      <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'projects')? 'active' : '' ?>"><a href="/projects"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'projects')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Projects &amp; Replacement</a></li>
      <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'workshop')? 'active' : '' ?>"><a href="/workshop"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'workshop')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Workshop</a></li>
            <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'reservation')? 'active' : '' ?>"><a href="/reservation"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'reservation')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Reservation Form
</a></li>

<li class="<?php echo (isset($menu['active']) && $menu['active'] == 'spo')? 'active' : '' ?>"><a href="/spo"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'spo')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> SPO
</a></li>
<li class="<?php echo (isset($menu['active']) && $menu['active'] == 'amenity')? 'active' : '' ?>"><a href="/amenity"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'amenity')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Guest Amenity Request
</a></li>
    <?php endif; ?>
<li class="<?php echo (isset($menu['active']) && $menu['active'] == 'settlement')? 'active' : '' ?>"><a href="/settlement"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'settlement')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Settlement Authorization Form
</a></li>

    <?php if (isset($is_admin) && $is_admin): ?>
      <li class="<?php echo (isset($menu['active']) && $menu['active'] == 'madar')? 'active' : '' ?>"><a href="/madar"><i class="fa <?php echo (isset($menu['active']) && $menu['active'] == 'madar')? 'fa-arrow-circle-right' : 'fa-dot-circle-o' ?>"></i> Madar</a></li>
    <?php endif; ?>

    </ul>

    <ul class="nav navbar-nav navbar-right navbar-user">
    <?php if (isset($is_owning_company) && $is_owning_company): ?>
      <li><a href="/reports" class="top-sm-btn"><i class="fa fa-list-alt"></i> Reports</a></li>
    <?php endif ?>
    <?php if (isset($is_admin) && $is_admin): ?>
      <li><a href="/reports" class="top-sm-btn"><i class="fa fa-list-alt"></i> Reports</a></li>
      <li><a href="/backend" class="top-sm-btn"><i class="fa fa-cogs"></i> Settings</a></li>
    <?php endif ?>
    <?php if (isset($is_GM) && $is_GM): ?>
      <li><a href="/reports" class="top-sm-btn"><i class="fa fa-list-alt"></i> Reports</a></li>
    <?php endif ?>
    <?php if (isset($username)): ?>
      <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle top-sm-btn" data-toggle="dropdown"><i class="fa fa-user glyphicon glyphicon-user"></i> <?php echo $username; ?><span><b class="caret"></b></span></a>
        <ul class="dropdown-menu">
          <li><a href="/auth/change_password"><i class="fa fa-lock"></i> Change Password</a></li>
          <li class="divider"></li>
          <li><a href="/auth/logout"><i class="fa fa-power-off"></i> Log Out</a></li>
        </ul>
      </li>
    <?php else: ?>
      <li><a href="/auth/login"><i class="fa fa-users"></i> Login</a></li>
    <?php endif; ?>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>
