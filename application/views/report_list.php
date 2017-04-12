<!DOCTYPE html>
<html lang="en">
<head>
<?php $this->load->view('header'); ?>
</head>
<body>
<div id="wrapper">
  <?php $this->load->view('menu') ?>
  <div id="page-wrapper">
    <div class="container">
      <div class="report-variant">
      <legend>Plan List</legend>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/plans/summary_report">Plan List Summary Report</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/plans/department_report">Plan List Department Report</a>
        </span>
        <br />
        <br />
        <br />
        <legend>Projects</legend>
        <span class="btn btn-default btn-file">Per Hotel: </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/unplanned_chairman">Unplanned Projects less than 30,000 LE</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/all_projects">All Projects (Waiting - Approve - Reject)</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/project_progress_report">Project Cost Control Report</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/project_progress_report_month">Project Execution Status Report</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/all_projects_delayed">Project Delayed</a>
        </span>
        <br />
        <br />
        <span class="btn btn-default btn-file">All Hotels: </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/unplanned_chairman/1">Unplanned Projects less than 30,000 LE</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/all_project_chairman/1">Projects Report (Waiting - Approve - Reject)</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/project_progress_report/1">Project Cost Control Report</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/project_progress_report_month/1">Project Execution Status Report</a>
        </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/project_reports/all_projects_delayed/1">Project Delayed</a>
        </span>


         <br />
        <br />
      <legend>Workshop Center</legend>
        <span class="btn btn-default btn-file">Per Hotel: </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/workshop_reports/all_requests/">All Workshop Orders</a>
        </span>
        <br />
        <br />
        <span class="btn btn-default btn-file">All Hotels: </span>
        <span class="btn btn-default btn-file">
          <a class="rprt-lnk" href="/workshop_reports/all_reports/">All Workshop Orders</a>
        </span>

      </div>
    </div>
  </div>
</div>
</body>
</html>