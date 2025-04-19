{ pkgs, ... }:
{
  programs.k9s = {
    enable = true;
    settings.k9s = {
      ui.skin = "catppuccin-mocha-transparent";
    };
    skins = {
      catppuccin-mocha-transparent = ./k9s-theme.yaml;
    };
  };

  home.packages = with pkgs; [
    kubectl
    krew
    kubernetes-helm
    fluxcd
  ];

  programs.fish.shellInit = ''
    set -gx KUBECONFIG $HOME/.kube/config
    for c in $HOME/.kube/conf.d/*
        set -gx KUBECONFIG $KUBECONFIG:$c
    end

    set -gx PATH $PATH $HOME/.krew/bin
  '';

  programs.fish.shellAbbrs = {
    k = "kubectl";
    kg = "kubectl get";
    kgp = "kubectl get pods";
    ke = "kubectl exec -it";
    ka = "kubectl apply";
    kd = "kubectl delete";
    kl = "kubectl logs";
  };
}
