<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/', name: 'app_index')]
class MemberController extends AbstractController
{
    public function __invoke()
    {
        return $this->render('pages/member/index.html.twig', []);
    }
}