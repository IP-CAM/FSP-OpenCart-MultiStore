<?php

class Pagination {

    public $total = 0;
    public $page = 1;
    public $limit = 20;
    public $num_links = 7;
    public $url = '';
    public $text = 'Showing {start} to {end} of {total} ({pages} Pages)';
    public $text_first = '|&lt;';
    public $text_last = '&gt;|';
    public $text_next = 'Next';
    public $text_prev = 'Prev';
    public $style_links = 'active';
    public $style_results = 'pull-left';

    public function render() {
        $total = $this->total;

        if ($this->page < 1) {
            $page = 1;
        } else {
            $page = $this->page;
        }

        if (!(int) $this->limit) {
            $limit = 10;
        } else {
            $limit = $this->limit;
        }

        $num_links = $this->num_links;
        $num_pages = ceil($total / $limit);

        $output = '';

        if ($page > 1) {
            $output .= '<li><a class="invarseColor" href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>';
        }


        if ($num_pages > 1) {
            if ($num_pages <= $num_links) {
                $start = 1;
                $end = $num_pages;
            } else {
                $start = $page - floor($num_links / 2);
                $end = $page + floor($num_links / 2);

                if ($start < 1) {
                    $end += abs($start) + 1;
                    $start = 1;
                }

                if ($end > $num_pages) {
                    $start -= ($end - $num_pages);
                    $end = $num_pages;
                }
            }

            if ($start > 1) {
                $output .= '<li class="extra-pagination"> .... </li>';
            }

            for ($i = $start; $i <= $end; $i++) {
                if ($page == $i) {
                    $output .= '<li class="active" ><a class="invarseColor">' . $i . '</a></li >';
                } else {
                    $output .= '<li ><a class="invarseColor" href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
                }
            }

            if ($end < $num_pages) {
                $output .= '<li class="extra-pagination"> .... </li>';
            }
        }

        if ($page < $num_pages) {
            $output .= '<li><a class="invarseColor" href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>';
        }

        $find = array(
            '{start}',
            '{end}',
            '{total}',
            '{pages}'
        );

        $replace = array(
            ($total) ? (($page - 1) * $limit) + 1 : 0,
            ((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit),
            $total,
            $num_pages
        );

        return ($output ? '<ul>' . $output . '</ul>' : '') . '<div class="' . $this->style_results . '">' . str_replace($find, $replace, $this->text) . '</div>';
    }

}

?>